class JSProperty {
  final String name;
  final List typeList;
  final String description;

  JSProperty.fromJson(Map<String, dynamic> json)
      : name = json['metadata']['title'],
        typeList =
            json['primaryContentSections'][0]['declarations'][0]['tokens'],
        description = json['abstract'][0]['text'];

  String convertTypeString() {
    var type = typeList.lastWhere(
        (element) => element['kind'] == 'typeIdentifier',
        orElse: () => {})['text'];
    final array = typeList.firstWhere(
        (element) => element['text'].trim() == '[]',
        orElse: () => {});
    final isAny = typeList.firstWhere(
        (element) => element['text'].trim() == '|',
        orElse: () => {});
    if (type == null) {
      final boolean = typeList.firstWhere(
          (element) => element['text'] == 'boolean',
          orElse: () => {});
      if (boolean.isNotEmpty) {
        type = 'JSBoolean';
      }
    }
    if (isAny.isNotEmpty) {
      type = 'JSAny';
    }

    switch (type) {
      case 'string':
        type = 'String';
        break;
      case 'number':
        type = 'JSNumber';
        break;
      case 'DOMPoint':
      case 'Element':
      case 'Date':
      case 'Object':
        type = 'JSAny';
        break;
      default:
    }
    if (array.isNotEmpty) {
      if (type == 'String') {
        type = 'JSString';
      }
      type = 'JSArray<$type>';
    }
    return type;
  }

  String output({bool root = false}) {
    final type = convertTypeString();

    var ignore = '';
    if (name.isNotEmpty && name[0].toUpperCase() == name[0]) {
      ignore = '// ignore: non_constant_identifier_names\n';
    }

    if (root) {
      return '/// $description\n@JS()\n${ignore}external $type $name;\n';
    } else {
      final indent = ''.padLeft(2);
      if (ignore.isNotEmpty) ignore = indent + ignore;
      return '$indent/// $description\n$ignore${indent}external $type $name;\n';
    }
  }
}
