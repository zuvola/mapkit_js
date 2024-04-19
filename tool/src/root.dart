import 'member.dart';
import 'class.dart';

class JSRoot extends Member {
  final classes = <JSClass>[];
  final enums = <String>[];

  String output() {
    final out = StringBuffer();
    for (var val in enums) {
      final exp = RegExp(r'(?<=\.)([^\.]+$)');
      final match = exp.firstMatch(val);
      final name = match?[0];
      out.writeln('typedef $name = JSString;');
    }
    for (var prop in properties) {
      out.writeln(prop.output(root: true));
    }
    for (var method in methods) {
      out.writeln(method.output(root: true));
    }
    for (var child in classes) {
      out.write(child.output());
    }
    return out.toString();
  }
}
