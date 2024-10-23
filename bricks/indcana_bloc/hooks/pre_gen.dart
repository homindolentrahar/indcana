import 'package:mason/mason.dart';

void run(HookContext context) {
  final feat = context.vars['feat'] as String;

  if (feat == "global") {
    context.vars['feat'] = null;
    context.vars['in_global'] = true;
  } else {
    context.vars['in_global'] = false;
  }
}
