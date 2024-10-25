import "../../../../core/api/api_service.dart";
import "../../../../core/di/injection.dart";
import '../dto/{{name.snakeCase()}}_dto.dart';

abstract interface class {{name.pascalCase()}}RemoteDataSource {
  Future<List<{{name.pascalCase()}}Dto>> get{{name.pascalCase()}}({
    int page = 1,
    int limit = 10,
  });

  Future<{{name.pascalCase()}}Dto> get{{name.pascalCase()}}ById(String id);
}

class {{name.pascalCase()}}RemoteDataSourceImpl implements {{name.pascalCase()}}RemoteDataSource {
  final Future<ApiService> apiService = injector.getAsync<ApiService>();

  @override
  Future<{{name.pascalCase()}}Dto> get{{name.pascalCase()}}ById(String id) async {
    throw UnimplementedError();
  }

  @override
  Future<List<{{name.pascalCase()}}Dto>> get{{name.pascalCase()}}({
    int page = 1,
    int limit = 10,
  }) async {
    throw UnimplementedError();
  }
}
