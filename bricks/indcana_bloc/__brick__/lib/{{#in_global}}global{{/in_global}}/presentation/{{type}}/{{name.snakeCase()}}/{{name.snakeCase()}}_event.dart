{{#immutable_equatable}}
part of '{{name.snakeCase()}}_bloc.dart';

abstract class {{name.pascalCase()}}Event extends Equatable {
  const {{name.pascalCase()}}Event();

  @override
  List<Object> get props => [];
}

class Get{{name.pascalCase()}}Event extends {{name.pascalCase()}}Event {
  {{#pagination}}
  final String? query;
  final int page;
  final int limit;
  {{/pagination}}

  const Get{{name.pascalCase()}}Event(
    {{#pagination}}
    {this.query,
    this.page = 1,
    this.limit = 10,}
    {{/pagination}}
  );

  @override
  List<Object> get props => [
        {{#pagination}}
        [query],
        page,
        limit
        {{/pagination}}
      ];
}
{{/immutable_equatable}}