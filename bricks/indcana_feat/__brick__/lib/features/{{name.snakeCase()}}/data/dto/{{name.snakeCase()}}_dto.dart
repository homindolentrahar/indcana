
import '../../domain/model/{{name.snakeCase()}}_model.dart';

class {{name.pascalCase()}}Dto {
  final String? id;
  final String? name; 

  {{name.pascalCase()}}Dto({
    this.id,
    this.name,
  });

  factory {{name.pascalCase()}}Dto.fromJson(Map<String, dynamic> json) => {{name.pascalCase()}}Dto(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };

  {{name.pascalCase()}}Model toModel() => {{name.pascalCase()}}Model(
    id: id,
    name: name,
  );
}