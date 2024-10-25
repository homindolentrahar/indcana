import 'package:dartz/dartz.dart';
import '../../../../core/error/app_error.dart';
import '../../../../core/util/logger_util.dart';
import '../../../../features/{{name.snakeCase()}}/data/data_source/{{name.snakeCase()}}_remote_data_source.dart';
import '../../../../features/{{name.snakeCase()}}/data/data_source/{{name.snakeCase()}}_local_data_source.dart';
import '../../../../features/{{name.snakeCase()}}/domain/model/{{name.snakeCase()}}_model.dart';
import '../../../../features/{{name.snakeCase()}}/domain/repository/{{name.snakeCase()}}_repository.dart';

class {{name.pascalCase()}}RepositoryImpl implements {{name.pascalCase()}}Repository {
  final {{name.pascalCase()}}RemoteDataSource remoteDataSource;
  final {{name.pascalCase()}}LocalDataSource localDataSource;

  {{name.pascalCase()}}RepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<AppError, List<{{name.pascalCase()}}Model>>> get{{name.pascalCase()}}({
    int page = 1,
    int limit = 10,
  }) async {
    try {
      // Do API call and cache the result here

      return Right([]);
    } on AppError catch (e) {
      LoggerUtil.instance().error(e.toString());
      return Left(e);
    }
  }
}
