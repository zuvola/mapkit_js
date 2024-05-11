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
        type = 'bool';
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
        type = 'double';
        break;
      case 'DOMPoint':
        type = 'web.DOMPoint';
        break;
      case 'Element':
        type = 'web.Element';
        break;
      case 'Date':
        type = 'JSAny';
        break;
      case 'Object':
        type = 'JSObject';
        break;
      default:
    }
    if (array.isNotEmpty) {
      if (type == 'String') {
        type = 'JSString';
      }
      if (type == 'bool') {
        type = 'JSBoolean';
      }
      if (type == 'double') {
        type = 'JSNumber';
      }
      type = 'JSArray<$type>';
    }
    if (name == 'userLocationAnnotation') {
      type += '?';
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
