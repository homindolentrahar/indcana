import '../entity/{{name.snakeCase()}}_entity.dart';

abstract interface class {{name.pascalCase()}}LocalDataSource {
  Future<List<{{name.pascalCase()}}Entity>> getCached{{name.pascalCase()}}();

  Future<{{name.pascalCase()}}Entity> getCached{{name.pascalCase()}}ById(String id);
}

class {{name.pascalCase()}}LocalDataSourceImpl implements {{name.pascalCase()}}LocalDataSource {
  @override
  Future<{{name.pascalCase()}}Entity> getCached{{name.pascalCase()}}ById(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List<{{name.pascalCase()}}Entity>> getCached{{name.pascalCase()}}() {
    throw UnimplementedError();
  }
}
