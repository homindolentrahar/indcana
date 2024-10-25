import '../../core/di/injection.dart';
import '../../features/{{name.snakeCase()}}/data/data_source/{{name.snakeCase()}}_remote_data_source.dart';
import '../../features/{{name.snakeCase()}}/data/data_source/{{name.snakeCase()}}_local_data_source.dart';
import '../../features/{{name.snakeCase()}}/domain/repository/{{name.snakeCase()}}_repository.dart';
import '../../features/{{name.snakeCase()}}/data/repository/{{name.snakeCase()}}_repository_impl.dart';
import '../../features/{{name.snakeCase()}}/domain/usecase/get_{{name.snakeCase()}}_uc.dart';

abstract class {{name.pascalCase()}}Module {
  static void inject() async {
    injector.registerLazySingleton<{{name.pascalCase()}}RemoteDataSource>(
      () => {{name.pascalCase()}}RemoteDataSourceImpl(),
    );
    injector.registerLazySingleton<{{name.pascalCase()}}LocalDataSource>(
      () => {{name.pascalCase()}}LocalDataSourceImpl(),
    );
    injector.registerLazySingleton<{{name.pascalCase()}}Repository>(
      () => {{name.pascalCase()}}RepositoryImpl(
        remoteDataSource: injector.get(),
        localDataSource: injector.get(),
      ),
    );

    // Usecases
    injector.registerLazySingleton<Get{{name.pascalCase()}}Uc>(
      () => Get{{name.pascalCase()}}Uc(
        injector.get(),
      ),
    );
  }
}