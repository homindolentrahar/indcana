import 'package:dartz/dartz.dart';
import '../../../../core/error/app_error.dart';
import '../../../../features/{{name.snakeCase()}}/domain/repository/{{name.snakeCase()}}_repository.dart';
import '../../../../features/{{name.snakeCase()}}/domain/model/{{name.snakeCase()}}_model.dart';

class Get{{name.pascalCase()}}Uc {
  final {{name.pascalCase()}}Repository repository;

  Get{{name.pascalCase()}}Uc(this.repository);

  Future<Either<AppError, List<{{name.pascalCase()}}Model>>> call({
    int page = 1,
    int limit = 10,
  }) async =>
      repository.get{{name.pascalCase()}}(page: page, limit: limit);

}