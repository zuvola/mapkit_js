class JSMethod {
  final String name;
  final List typeList;
  final String description;

  JSMethod.fromJson(Map<String, dynamic> json)
      : name = json['metadata']['title'],
        typeList =
            json['primaryContentSections'][0]['declarations'][0]['tokens'],
        description = json['abstract'][0]['text'];

  String output({bool root = false}) {
    final out = StringBuffer();
    var optional = false;
    for (var element in typeList) {
      var text = element['text'];
      if (text == '\n') continue;
      if (text == '    ') continue;
      if (text == 'new') text = '';
      if (text == 'string') text = 'String';
      if (text == 'boolean') text = 'bool';
      if (text == 'number') {
        final a = {
          'cancel',
          'lookup',
          'reverseLookup',
          'search',
          'autocomplete',
          'eta',
          'route',
          'addColorStopAtIndex'
        };
        if (a.contains(name)) {
          text = 'int';
        } else {
          text = 'double';
        }
      }
      if (text == 'function') text = 'JSFunction';
      if (text == 'Object') text = 'JSObject';
      if (text == 'DOMPoint') text = 'web.DOMPoint';
      if (text == 'Element') text = 'web.Element';
      if (optional && text != ' ') {
        text += '?';
        optional = false;
      }
      if (text == 'optional') {
        if (element == typeList.first) {
          text = '';
        } else {
          optional = true;
        }
      }
      if (text == '    optional number left)') {
        text = 'double? left';
      }
      out.write(text);
    }
    // print(out);
    var declarations = out.toString().replaceAll('optional ', '');
    declarations = declarations.replaceAll('mapkit.', '');
    declarations = declarations.replaceAll('(Error', '(JSAny');
    // JSAny
    declarations = declarations.replaceAll(RegExp(r'^\(.*?\|.*?\s'), 'JSAny ');
    declarations = declarations.replaceAll(RegExp(r'\(.*?\|.*?\s'), '(JSAny ');
    declarations = declarations.replaceAll(RegExp(r'^\w*?\|.*?\s'), 'JSAny ');
    declarations =
        declarations.replaceAll(RegExp(r'\s[a-zA-Z\?]*?\|.*?\s'), ' JSAny ');
    // JSArray
    declarations =
        declarations.replaceAllMapped(RegExp(r'([a-zA-z]*)\[\]'), (Match m) {
      return 'JSArray<${m[1]}>';
    });

    if (root) {
      return '/// $description\n@JS()\nexternal $declarations\n';
    } else {
      final indent = ''.padLeft(2);
      return '$indent/// $description\n${indent}external $declarations\n';
    }
  }
}
