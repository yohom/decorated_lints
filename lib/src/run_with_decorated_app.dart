import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class RunDecoratedFlutter extends DartLintRule {
  const RunDecoratedFlutter() : super(code: _code);

  static const _code = LintCode(
    name: 'run_app_with_decorated_app',
    problemMessage: '使用runDecoratedApp来启动App',
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    if (!resolver.path.endsWith('main.dart')) return;

    context.registry.addMethodInvocation((node) {
      if (node.methodName.name == 'runApp') {
        reporter.reportErrorForNode(code, node);
      }
    });
  }
}
