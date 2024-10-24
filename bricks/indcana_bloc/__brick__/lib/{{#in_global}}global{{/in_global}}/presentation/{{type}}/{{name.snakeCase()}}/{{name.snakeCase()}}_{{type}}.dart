{{#immutable_equatable}}import 'package:equatable/equatable.dart';{{/immutable_equatable}}
{{#immutable_freezed}}import 'package:freezed_annotation/freezed_annotation.dart';{{/immutable_freezed}}
import 'package:flutter_bloc/flutter_bloc.dart';
{{#pagination}}import 'package:pull_to_refresh/pull_to_refresh.dart';{{/pagination}}
{{#pagination}}import '../../../../../core/constant/base_constant.dart';{{/pagination}}

{{#type_bloc}}part '{{name.snakeCase()}}_event.dart';{{/type_bloc}}
part '{{name.snakeCase()}}_state.dart';
{{#immutable_freezed}}part '{{name.snakeCase()}}_{{type}}.freezed.dart';{{/immutable_freezed}}

{{#type_bloc}}
class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {
  {{#pagination}}final RefreshController refreshController = RefreshController();{{/pagination}}

  {{name.pascalCase()}}Bloc() : super(
   {{^pagination}}
    {{#immutable_equatable}}{{name.pascalCase()}}StateInit(){{/immutable_equatable}}
    {{#immutable_freezed}}{{name.pascalCase()}}State.init(){{/immutable_freezed}}
   {{/pagination}}
   {{#pagination}}const {{name.pascalCase()}}State(){{/pagination}}
  ) {
    on<{{name.pascalCase()}}Event>((event, emit) {
      event.map(
        {{#immutable_equatable}}Get{{name.pascalCase()}}Event: (instance) async { {{/immutable_equatable}}
        {{#immutable_freezed}}Get{{name.pascalCase()}}: (instance) async { {{/immutable_freezed}}
          try {
            emit(
              {{^pagination}}
                {{#immutable_equatable}}{{name.pascalCase()}}StateLoading(){{/immutable_equatable}}
                {{#immutable_freezed}}{{name.pascalCase()}}State.loading(){{/immutable_freezed}}
              {{/pagination}}
              {{#pagination}}
                state.copyWith(status: BaseStatus.loading)
              {{/pagination}}
            );

          final data = ['User 1', 'User 2', 'User 3'];
          emit(
            {{^pagination}}
              {{#immutable_equatable}}{{name.pascalCase()}}StateSuccess(data){{/immutable_equatable}}
              {{#immutable_freezed}}{{name.pascalCase()}}State.success(data: data){{/immutable_freezed}}
            {{/pagination}}
            {{#pagination}}
              state.copyWith(status: BaseStatus.success, data: data)
            {{/pagination}}
          );
        } catch (e) {
          emit(
            {{^pagination}} 
              {{#immutable_equatable}}{{name.pascalCase()}}StateError(message: e.toString()){{/immutable_equatable}}
              {{#immutable_freezed}}{{name.pascalCase()}}State.error(message: e.toString()){{/immutable_freezed}}
            {{/pagination}}
            {{#pagination}}
              state.copyWith(status: BaseStatus.error, message: e.toString())
            {{/pagination}}
          );
          }
        }
      ); 
    });
  }
}
{{/type_bloc}}

{{#type_cubit}}
class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
  {{name.pascalCase()}}Cubit() : super(
   {{^pagination}}
    {{#immutable_equatable}}{{name.pascalCase()}}StateInit(){{/immutable_equatable}}
    {{#immutable_freezed}}{{name.pascalCase()}}State.init(){{/immutable_freezed}}
   {{/pagination}}
   {{#pagination}}{{name.pascalCase()}}State(){{/pagination}}
  );

  Future<void> loadData() async {
    try {
      emit(
        {{^pagination}}
          {{#immutable_equatable}}{{name.pascalCase()}}StateLoading(){{/immutable_equatable}}
          {{#immutable_freezed}}{{name.pascalCase()}}State.loading(){{/immutable_freezed}}
        {{/pagination}}
        {{#pagination}}
          state.copyWith(status: BaseStatus.loading)
        {{/pagination}}
      );

      final data = ['User 1', 'User 2', 'User 3'];
      emit(
        {{^pagination}}
          {{#immutable_equatable}}{{name.pascalCase()}}StateSuccess(data){{/immutable_equatable}}
          {{#immutable_freezed}}{{name.pascalCase()}}State.success(data: data){{/immutable_freezed}}
        {{/pagination}}
        {{#pagination}}state.copyWith(status: BaseStatus.success, data: data){{/pagination}}

      );
    } catch (e) {
      emit(
        {{^pagination}} 
          {{#immutable_equatable}}{{name.pascalCase()}}StateError(message: e.toString()){{/immutable_equatable}}
          {{#immutable_freezed}}{{name.pascalCase()}}State.error(message: e.toString()){{/immutable_freezed}}
        {{/pagination}}
        {{#pagination}}state.copyWith(status: BaseStatus.error, message: e.toString()){{/pagination}}
      );
    }
  }
}
{{/type_cubit}}
