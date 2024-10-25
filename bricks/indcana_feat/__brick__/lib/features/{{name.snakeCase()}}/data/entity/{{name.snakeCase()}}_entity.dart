class {{name.pascalCase()}}Entity {
  final String? id;
  final String? name; 

  const {{name.pascalCase()}}Entity ({
    this.id,
    this.name,
  });
}