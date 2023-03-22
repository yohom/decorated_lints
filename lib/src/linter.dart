import 'package:custom_lint_builder/custom_lint_builder.dart';

import 'run_with_decorated_app.dart';

class DecoratedLinter extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        const RunDecoratedFlutter(),
      ];
}
