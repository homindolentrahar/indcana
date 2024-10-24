{{#immutable_equatable}}
part of '{{name.snakeCase()}}_{{type}}.dart';

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
  final dynamic data;
  final int? statusCode;
  final String? message;
  final String? query;
  final int page;
  final int limit;

  const {{name.pascalCase()}}State({
    this.data,
    this.statusCode,
    this.message,
    this.status = BaseStatus.init,
    this.query,
    this.page = 1,
    this.limit = 10,
  });

  {{name.pascalCase()}}State copyWith({
    BaseStatus? status,
    dynamic data,
    int? statusCode,
    String? message,
    String? query,
    int? page,
    int? limit,
  }) => {{name.pascalCase()}}State(
    status: status ?? this.status,
    data: data ?? this.data,
    statusCode: statusCode ?? this.statusCode,
    message: message ?? this.message,
    query: query ?? this.query,
    page: page ?? this.page,
    limit: limit ?? this.limit,
  );

  @override
  List<Object?> get props => [[query], page, limit];
}
{{/pagination}}

{{/immutable_equatable}}