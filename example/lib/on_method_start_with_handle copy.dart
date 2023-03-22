import 'package:decorated_flutter/decorated_flutter.dart';

class TestBLoC extends LocalBLoC with _ComponentBLoC {
  TestBLoC(super.semantics);

  final testIO = IO(seedValue: 0, semantics: '测试');
}

mixin _ComponentBLoC on LocalBLoC {
  void test() {}
}
