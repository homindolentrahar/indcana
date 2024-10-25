import 'package:dartz/dartz.dart';
import 'package:{{name.snakeCase()}}/core/error/app_error.dart';
import 'package:{{name.snakeCase()}}/features/users/domain/model/user_model.dart';
import 'package:{{name.snakeCase()}}/features/users/domain/repository/users_repository.dart';

class GetUsersUc {
  final UsersRepository repository;

  GetUsersUc(this.repository);

  Future<Either<AppError, List<UserModel>>> call({
    int page = 1,
    int limit = 10,
  }) async =>
      repository.getUsers(page: page, limit: limit);
}
