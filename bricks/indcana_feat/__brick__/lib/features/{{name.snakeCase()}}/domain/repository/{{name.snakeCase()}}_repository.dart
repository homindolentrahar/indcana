import 'package:dartz/dartz.dart';
import '../../../../core/error/app_error.dart';
import '../../../../features/{{name.snakeCase()}}/domain/model/{{name.snakeCase()}}_model.dart';

abstract interface class {{name.pascalCase()}}Repository {
  Future<Either<AppError, List<{{name.pascalCase()}}Model>>> get{{name.pascalCase()}}({
    int page = 1,
    int limit = 10,
  });
}