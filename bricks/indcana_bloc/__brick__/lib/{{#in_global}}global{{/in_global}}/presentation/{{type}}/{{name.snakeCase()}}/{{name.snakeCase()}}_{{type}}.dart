{{#immutable_equatable}}import 'package:equatable/equatable.dart';{{/immutable_equatable}}
{{#immutable_freezed}}import 'package:freezed_annotation/freezed_annotation.dart';{{/immutable_freezed}}
import 'package:flutter_bloc/flutter_bloc.dart';
{{#pagination}}
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../core/constant/base_constant.dart';
{{/pagination}}

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
        {{#immutable_equatable}}
        switch(event){
          case Get{{name.pascalCase()}}Event(): (instance) async {
          try {
            emit(
              {{^pagination}}
                {{#immutable_equatable}}{{name.pascalCase()}}StateLoading(){{/immutable_equatable}}
                {{#immutable_freezed}}{{name.pascalCase()}}State.loading(){{/immutable_freezed}}
              {{/pagination}}
              {{#pagination}}
                state.copyWith(
                  status: BaseStatus.loading,
                  query: instance.query,
                  page: instance.page, 
                  limit: instance.limit,
                )
              {{/pagination}}
            );

          final data = ['User 1', 'User 2', 'User 3'];
          {{#pagination}}
          final listOfData = state.data;

          if (instance.page <= 1) {
            listOfData.clear();
          }

          listOfData.addAll(data);
          {{/pagination}}

          emit(
            {{^pagination}}
              {{#immutable_equatable}}{{name.pascalCase()}}StateSuccess(data){{/immutable_equatable}}
              {{#immutable_freezed}}{{name.pascalCase()}}State.success(data: data){{/immutable_freezed}}
            {{/pagination}}
            {{#pagination}}
              state.copyWith(
                status: BaseStatus.success,
                data: listOfData,
                hasMoreData: !(data.length < instance.limit),
              )
            {{/pagination}}
          );

          {{#pagination}}
          _completeLoad();
          {{/pagination}}
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

          {{#pagination}}
          _completeLoad();
          {{/pagination}}
          }
          };
        }
        {{/immutable_equatable}}
        {{#immutable_freezed}}
        event.map(
          Get{{name.pascalCase()}}: (instance) async { 
          try {
            emit(
              {{^pagination}}
                {{#immutable_equatable}}{{name.pascalCase()}}StateLoading(){{/immutable_equatable}}
                {{#immutable_freezed}}{{name.pascalCase()}}State.loading(){{/immutable_freezed}}
              {{/pagination}}
              {{#pagination}}
                state.copyWith(
                  status: BaseStatus.loading,
                  query: instance.query,
                  page: instance.page, 
                  limit: instance.limit,
                )
              {{/pagination}}
            );

          final data = ['User 1', 'User 2', 'User 3'];
          {{#pagination}}
          final listOfData = state.data;

          if (instance.page <= 1) {
            listOfData.clear();
          }

          listOfData.addAll(data);
          {{/pagination}}

          emit(
            {{^pagination}}
              {{#immutable_equatable}}{{name.pascalCase()}}StateSuccess(data){{/immutable_equatable}}
              {{#immutable_freezed}}{{name.pascalCase()}}State.success(data: data){{/immutable_freezed}}
            {{/pagination}}
            {{#pagination}}
              state.copyWith(
                status: BaseStatus.success,
                data: listOfData,
                hasMoreData: !(data.length < instance.limit),
              )
            {{/pagination}}
          );

          {{#pagination}}
          _completeLoad();
          {{/pagination}}
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

          {{#pagination}}
          _completeLoad();
          {{/pagination}}
          } 
        }
      ); 
      {{/immutable_freezed}}
    });
  }

  {{#pagination}}
  void _completeLoad() {
    if (refreshController.isLoading) {
      refreshController.loadComplete();
    }
    if (refreshController.isRefresh) {
      refreshController.refreshCompleted();
    }
  }
  {{/pagination}}
}
{{/type_bloc}}

{{#type_cubit}}
class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
  {{#pagination}}final RefreshController refreshController = RefreshController();{{/pagination}}

  {{name.pascalCase()}}Cubit() : super(
   {{^pagination}}
    {{#immutable_equatable}}{{name.pascalCase()}}StateInit(){{/immutable_equatable}}
    {{#immutable_freezed}}{{name.pascalCase()}}State.init(){{/immutable_freezed}}
   {{/pagination}}
   {{#pagination}}{{name.pascalCase()}}State(){{/pagination}}
  );

  Future<void> loadData({
    String? query,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      emit(
        {{^pagination}}
          {{#immutable_equatable}}{{name.pascalCase()}}StateLoading(){{/immutable_equatable}}
          {{#immutable_freezed}}{{name.pascalCase()}}State.loading(){{/immutable_freezed}}
        {{/pagination}}
        {{#pagination}}
          state.copyWith(
            status: BaseStatus.loading,
            query: query, 
            page: page,
            limit: limit,
          )
        {{/pagination}}
      );

      final data = ['User 1', 'User 2', 'User 3'];
      {{#pagination}}
      final listOfData = state.data;

      if (page <= 1) {
        listOfData.clear();
      }

      listOfData.addAll(data);
      {{/pagination}}

      emit(
        {{^pagination}}
          {{#immutable_equatable}}{{name.pascalCase()}}StateSuccess(data){{/immutable_equatable}}
          {{#immutable_freezed}}{{name.pascalCase()}}State.success(data: data){{/immutable_freezed}}
        {{/pagination}}
        {{#pagination}}
        state.copyWith(
          status: BaseStatus.success, 
          data: listOfData,
          hasMoreData: !(data.length < limit),
        )
        {{/pagination}}
      );

      {{#pagination}}
      _completeLoad();
      {{/pagination}}
    } catch (e) {
      emit(
        {{^pagination}} 
          {{#immutable_equatable}}{{name.pascalCase()}}StateError(message: e.toString()){{/immutable_equatable}}
          {{#immutable_freezed}}{{name.pascalCase()}}State.error(message: e.toString()){{/immutable_freezed}}
        {{/pagination}}
        {{#pagination}}state.copyWith(status: BaseStatus.error, message: e.toString()){{/pagination}}
      );

      {{#pagination}}
      _completeLoad();
      {{/pagination}}
    }
  }

  {{#pagination}}
  void _completeLoad() {
    if (refreshController.isLoading) {
      refreshController.loadComplete();
    }
    if (refreshController.isRefresh) {
      refreshController.refreshCompleted();
    }
  }
  {{/pagination}}
}
{{/type_cubit}}
