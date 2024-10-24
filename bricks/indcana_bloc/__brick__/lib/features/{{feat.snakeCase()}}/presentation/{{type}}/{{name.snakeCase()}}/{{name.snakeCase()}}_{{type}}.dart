{{#immutable_equatable}}import 'package:equatable/equatable.dart';{{/immutable_equatable}}
import 'package:flutter_bloc/flutter_bloc.dart';
{{#pagination}}import '../../../../../core/constant/base_constant.dart';{{/pagination}}

part '{{name.snakeCase()}}_event.dart';
part '{{name.snakeCase()}}_state.dart';

{{#type_bloc}}
class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {
  {{name.pascalCase()}}Bloc() : super(
   {{^pagination}}{{name.pascalCase()}}StateInit(){{/pagination}}
   {{#pagination}}const {{name.pascalCase()}}State(){{/pagination}}
  ) {
    on<Get{{name.pascalCase()}}Event>((event, emit) async {
      try {
        emit(
          {{^pagination}}{{name.pascalCase()}}StateLoading(){{/pagination}}
          {{#pagination}}state.copyWith(status: BaseStatus.loading){{/pagination}}
        );

        final data = ['User 1', 'User 2', 'User 3'];
        emit(
          {{^pagination}}{{name.pascalCase()}}StateSuccess(data){{/pagination}}
          {{#pagination}}state.copyWith(status: BaseStatus.success, data: data){{/pagination}}
        );
      } catch (e) {
        emit(
          {{^pagination}}{{name.pascalCase()}}StateError(message: e.toString()){{/pagination}}
          {{#pagination}}state.copyWith(status: BaseStatus.error, message: e.toString()){{/pagination}}
        );
      }
    });
  }
}
{{/type_bloc}}

