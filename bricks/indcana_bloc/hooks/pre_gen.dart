import 'package:mason/mason.dart';

void run(HookContext context) {
  final feat = context.vars['feat'] as String;
  final immutable = context.vars['immutable'] as String;
  final type = context.vars['type'] as String;

  final immutableEquatable = immutable == 'equatable';
  final immutableFreezed = immutable == 'freezed';
  final typeCubit = type == 'cubit';
  final typeBloc = type == 'bloc';

  context.vars['immutable_equatable'] = immutableEquatable;
  context.vars['immutable_freezed'] = immutableFreezed;
  context.vars['type_cubit'] = typeCubit;
  context.vars['type_bloc'] = typeBloc;

  if (feat == "global") {
    context.vars['feat'] = null;
    context.vars['in_global'] = true;
  } else {
    context.vars['in_global'] = false;
  }
}
