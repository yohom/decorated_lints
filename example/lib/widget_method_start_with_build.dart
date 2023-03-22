import 'package:flutter/material.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    _buildMethod();
    return Center(
      child: _testMethod(),
    );
  }

  Widget _testMethod() {
    return const Center();
  }

  Widget _buildMethod() {
    return const Center();
  }
}

// Stateful
class StatefulTestWidget extends StatefulWidget {
  const StatefulTestWidget({super.key});

  @override
  State<StatefulTestWidget> createState() => _StatefulTestWidgetState();
}

class _StatefulTestWidgetState extends State<StatefulTestWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: _testMethod(),
    );
  }

  Widget _testMethod() {
    return const Center();
  }
}
