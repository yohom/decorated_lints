import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:decorated_lints/src/_no_io_in_bloc.dart';
import 'package:decorated_lints/src/_no_method_in_component_mixin.dart';
import 'package:decorated_lints/src/_on_method_start_with_handle.dart';
import 'package:decorated_lints/src/_widget_method_start_with_build.dart';

import '_run_with_decorated_app.dart';

class DecoratedLinter extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        const RunDecoratedFlutter(),
        const NoIOInBLoC(),
        const NoMethodInComponentMixin(),
        const OnMethodStartWithHandle(),
        const WidgetMethodStartWithBuild(),
      ];
}
