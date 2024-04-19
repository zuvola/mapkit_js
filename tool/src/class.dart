import 'member.dart';

class JSClass extends Member {
  String name;
  String description;
  JSClass({
    required this.name,
    required this.description,
  });

  String output() {
    final out = StringBuffer();
    out.writeln('/// $description');
    out.writeln('extension type $name._(JSObject _) implements JSObject {');
    if (init != null) {
      out.write(init!.output());
    } else {
      out.write('  external $name({');
      for (var prop in properties) {
        if (properties.first != prop) {
          out.write(', ');
        }
        out.write('${prop.convertTypeString()} ${prop.name}');
      }
      if (properties.isNotEmpty && methods.isNotEmpty) {
        out.write(', ');
      }
      for (var method in methods) {
        if (methods.first != method) {
          out.write(', ');
        }
        out.write('JSFunction ${method.name}');
      }
      out.writeln('});');
    }
    for (var prop in properties) {
      out.writeln(prop.output());
    }
    for (var method in methods) {
      out.writeln(method.output());
    }
    out.writeln('}');
    return out.toString();
  }
}
