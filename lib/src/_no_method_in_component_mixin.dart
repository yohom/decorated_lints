import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class NoMethodInComponentMixin extends DartLintRule {
  const NoMethodInComponentMixin() : super(code: _code);

  static const _code = LintCode(
    name: '_no_method_in_component_mixin',
    problemMessage: '不要在_ComponentMixin中放方法, 放到`BLoC`中去',
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addMixinDeclaration((node) {
      final mixin_ = node.declaredElement;
      final isComponentMixin = node.name.toString() == '_ComponentBLoC';
      final hasMethod = mixin_?.methods.isNotEmpty;

      if (isComponentMixin == true && hasMethod == true) {
        reporter.reportErrorForNode(code, node);
      }
    });
  }
}
