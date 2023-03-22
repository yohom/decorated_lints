import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class NoIOInBLoC extends DartLintRule {
  const NoIOInBLoC() : super(code: _code);

  static const _code = LintCode(
    name: 'no_io_in_bloc',
    problemMessage: '不要在BLoC中放置IO, 放到`_ComponentMixin`中去',
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addClassDeclaration((node) {
      final clazz = node.declaredElement;
      final superClass =
          clazz?.supertype?.getDisplayString(withNullability: false);
      final isBLoC =
          ['LocalBLoC', 'GlobalBLoC', 'RootBLoC'].contains(superClass);

      final hasIO = clazz?.fields.isNotEmpty;
      if (isBLoC == true && hasIO == true) {
        reporter.reportErrorForNode(code, node);
      }
    });
  }
}
