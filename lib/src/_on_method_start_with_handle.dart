import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

// TODO 待实现
class OnMethodStartWithHandle extends DartLintRule {
  const OnMethodStartWithHandle() : super(code: _code);

  static const _code = LintCode(
    name: 'on_method_start_with_handle',
    problemMessage: '处理回调的方法, 用`_handle`开头',
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
