import 'method.dart';
import 'property.dart';

abstract class Member {
  final properties = <JSProperty>[];
  final methods = <JSMethod>[];
  JSMethod? init;
}
