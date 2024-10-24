import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'src/class.dart';
import 'src/member.dart';
import 'src/property.dart';
import 'src/method.dart';
import 'src/root.dart';

void main() async {
  final json = await loadPath('/index/mapkitjs');
  final doc = json['interfaceLanguages']['data'][0]['children'][4]['children'];

  final jsroot = JSRoot();
  await parse(jsroot, jsroot, doc);

  final out = StringBuffer();
  out.write(
      "@JS('mapkit')\nlibrary;\n\nimport 'dart:js_interop';\nimport 'package:web/web.dart' as web;\n\n");

  out.write(jsroot.output());

  final file = File('./lib/src/mapkit_js_api.dart');
  await file.create(recursive: true);
  await file.writeAsString(out.toString());
  print('done!');
}

Future<dynamic> loadPath(String path) async {
  final file = File('./tool/data$path');
  if (file.existsSync()) {
    final input = await File('./tool/data$path').readAsString();
    return jsonDecode(input);
  } else {
    final url = 'https://developer.apple.com/tutorials/data$path';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      print('Failed to load page: ${response.statusCode}');
      return;
    }
    file.createSync(recursive: true);
    file.writeAsString(response.body);
    return jsonDecode(response.body);
  }
}

Future<void> parse(JSRoot root, Member member, List children) async {
  for (var child in children) {
    final type = child['type'] as String;
    final title = child['title'] as String;
    final path = child['path'] as String?;

    switch (type) {
      case 'method' || 'init':
        final json = await loadPath('$path.json');
        final method = JSMethod.fromJson(json);
        if (type == 'init') {
          /// Covers documentation error
          if (title == 'mapkit.PointsOfInterestSearch') {
            method.typeList.insert(9, {"kind": "text", "text": " options"});
          }
          member.init = method;
        } else {
          member.methods.add(method);
        }
      case 'property':
        final json = await loadPath('$path.json');
        final prop = JSProperty.fromJson(json);
        member.properties.add(prop);
        final children = child['children'] as List?;
        if (children != null) {
          await parse(root, member, children);
        }
      case 'collection':
        await parse(root, member, child['children']);
      case 'enum':
        root.addEnum(title);
      case 'class' || 'struct':
        print(title);
        final json = await loadPath('$path.json');
        final description = json['abstract'][0]['text'];
        var name = title.replaceAll('mapkit.', '');
        // Covers documentation error
        if (name == 'SearchAutocompleteOptions') {
          name = 'SearchAutoCompleteOptions';
        }
        final jsclass = JSClass(name: name, description: description);
        if (json['relationshipsSections'] != null) {
          final inherit =
              json['relationshipsSections'][0]['identifiers'][0] as String;
          final name = inherit.split('/').last;
          final parentJson =
              await loadPath('/documentation/mapkitjs/$name.json');
          jsclass.parent =
              parentJson['metadata']['title'].replaceAll('mapkit.', '');
        }
        root.addClass(title, jsclass);
        await parse(root, jsclass, child['children']);
      default:
    }
  }
}
