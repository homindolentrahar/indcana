part of '{{name.snakeCase()}}_{{type}}.dart';

{{#immutable_equatable}}
{{^pagination}}
sealed class {{name.pascalCase()}}State extends Equatable {
  @override
  List<Object?> get props => [];
}

class {{name.pascalCase()}}StateInit extends {{name.pascalCase()}}State {}

class {{name.pascalCase()}}StateLoading extends {{name.pascalCase()}}State {}

class {{name.pascalCase()}}StateSuccess extends {{name.pascalCase()}}State {
  final dynamic data;

  {{name.pascalCase()}}StateSuccess(this.data);

  @override
  List<Object> get props => [data];
}

class {{name.pascalCase()}}StateError extends {{name.pascalCase()}}State {
  final int? statusCode;
  final String? message;

  {{name.pascalCase()}}StateError({this.statusCode, this.message});

  @override
  List<Object> get props => [
        [message, statusCode]
      ];
}
{{/pagination}}

{{#pagination}}
class {{name.pascalCase()}}State extends Equatable {
  final BaseStatus status;
  final List<dynamic> data;
  final int? statusCode;
  final String? message;
  final String? query;
  final int page;
  final int limit;
  final bool hasMoreData;

  const {{name.pascalCase()}}State({
    this.status = BaseStatus.init,
    this.data = const [],
    this.statusCode,
    this.message,
    this.query,
    this.page = 1,
    this.limit = 10,
    this.hasMoreData = false,
  });

  {{name.pascalCase()}}State copyWith({
    BaseStatus? status,
    List<dynamic>? data,
    int? statusCode,
    String? message,
    String? query,
    int? page,
    int? limit,
    bool? hasMoreData,
  }) => {{name.pascalCase()}}State(
    status: status ?? this.status,
    data: data ?? this.data,
    statusCode: statusCode ?? this.statusCode,
    message: message ?? this.message,
    query: query ?? this.query,
    page: page ?? this.page,
    limit: limit ?? this.limit,
    hasMoreData: hasMoreData ?? this.hasMoreData
  );

  @override
  List<Object?> get props => [[statusCode, message, query], status, data, page, limit, hasMoreData];
}
{{/pagination}}
{{/immutable_equatable}}

{{#immutable_freezed}}
{{#pagination}}
@freezed
class {{name.pascalCase()}}State with _${{name.pascalCase()}}State {
  const factory {{name.pascalCase()}}State({
    @Default(BaseStatus.init) BaseStatus status,
    @Default([]) List<dynamic> data,
    int? statusCode,
    String? message,
    String? query,
    @Default(1) int page,
    @Default(10) int limit,
    @Default(false) bool hasMoreData,
  }) = _{{name.pascalCase()}}State;
}
{{/pagination}}
{{^pagination}}
@freezed
class {{name.pascalCase()}}State with _${{name.pascalCase()}}State {
   factory {{name.pascalCase()}}State.init() = _Init;
   factory {{name.pascalCase()}}State.loading() = _Loading;
   factory {{name.pascalCase()}}State.success({
    dynamic data,
  }) = _Success;
  const factory {{name.pascalCase()}}State.error({
    int? statusCode,
    String? message,
  }) = _Error;
}
{{/pagination}}
{{/immutable_freezed}}