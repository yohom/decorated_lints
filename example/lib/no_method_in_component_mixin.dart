import 'package:decorated_flutter/decorated_flutter.dart';

class TestBLoC extends LocalBLoC with _ComponentBLoC {
  TestBLoC(super.semantics);
}

mixin _ComponentBLoC on LocalBLoC {
  void test() {}
}
