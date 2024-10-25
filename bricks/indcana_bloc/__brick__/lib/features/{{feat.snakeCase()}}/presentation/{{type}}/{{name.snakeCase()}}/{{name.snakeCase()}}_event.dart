{{#type_bloc}}
part of '{{name.snakeCase()}}_{{type}}.dart';

{{#immutable_equatable}}
sealed class {{name.pascalCase()}}Event extends Equatable {
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

{{#immutable_freezed}}
@freezed
class {{name.pascalCase()}}Event with _${{name.pascalCase()}}Event {
  {{#pagination}}
  const factory {{name.pascalCase()}}Event.Get{{name.pascalCase()}}(
    {String? query,
    @Default(1) int page,
    @Default(10) int limit,}
  ) = _Get{{name.pascalCase()}};
  {{/pagination}}
  {{^pagination}}
  const factory {{name.pascalCase()}}Event.Get{{name.pascalCase()}}() = _Get{{name.pascalCase()}};
  {{/pagination}}
}
{{/immutable_freezed}}

{{/type_bloc}}