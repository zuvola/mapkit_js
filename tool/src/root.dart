import 'member.dart';
import 'class.dart';

class JSRoot extends Member {
  final _classes = <String, JSClass>{};
  final _enums = <String>[];
  final exp = RegExp(r'(?<=\.)([^\.]+$)');

  void addEnum(String title) {
    final match = exp.firstMatch(title);
    final name = match?[0];
    if (name != null && !_enums.contains(name)) {
      _enums.add(name);
    }
  }

  void addClass(String name, JSClass jsclass) {
    if (_classes[name] == null) {
      _classes[name] = jsclass;
    }
  }

  String output() {
    final out = StringBuffer();
    out.writeln('typedef PlaceDatailOptions = JSAny;');
    for (var val in _enums) {
      out.writeln('typedef $val = JSString;');
    }
    for (var prop in properties) {
      out.writeln(prop.output(root: true));
    }
    for (var method in methods) {
      out.writeln(method.output(root: true));
    }
    for (var child in _classes.values) {
      out.write(child.output());
    }
    return out.toString();
  }
}
