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
  const factory {{name.pascalCase()}}Event.Get{{name.pascalCase()}}(
    {const {#pagination}}
    {String? query,
    @Default(1) int page,
    @Default(10) int limit,}
    {{/pagination}}
  ) = _Get{{name.pascalCase()}};
}
{{/immutable_freezed}}

{{/type_bloc}}