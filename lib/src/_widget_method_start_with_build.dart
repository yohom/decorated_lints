import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class WidgetMethodStartWithBuild extends DartLintRule {
  const WidgetMethodStartWithBuild() : super(code: _code);

  static const _code = LintCode(
    name: 'widget_method_start_with_build',
    problemMessage: '返回Widget的方法, 用`_build`开头',
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addClassDeclaration((node) {
      final clazz = node.declaredElement;
      final isWidget = RegExp(r'StatelessWidget|State<.*>').hasMatch(
          clazz?.supertype?.getDisplayString(withNullability: false) ?? '');

      if (isWidget == true) {
        for (final method in clazz?.methods ?? <MethodElement>[]) {
          final isBuildMethod = method.name == 'build';
          final methodReturnWidget =
              method.returnType.getDisplayString(withNullability: false) ==
                  'Widget';
          final startWithBuild = method.name.startsWith('_build');
          if (!isBuildMethod && methodReturnWidget && !startWithBuild) {
            reporter.reportErrorForElement(_code, method);
          }
        }
      }
    });
  }
}
