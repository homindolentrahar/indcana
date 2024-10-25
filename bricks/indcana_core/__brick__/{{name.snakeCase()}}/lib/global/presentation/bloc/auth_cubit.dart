import 'package:{{name.snakeCase()}}/core/constant/auth_constant.dart';
import 'package:{{name.snakeCase()}}/core/di/injection.dart';
import 'package:{{name.snakeCase()}}/core/util/secure_storage_util.dart';
import 'package:{{name.snakeCase()}}/global/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final SecureStorageUtil secureStorageUtil = injector.get<SecureStorageUtil>();

  AuthCubit() : super(AuthState());

  Future<void> authenticate({
    String? userId,
    String? accessToken,
  }) async {
    await Future.wait([
      secureStorageUtil.saveUserId(userId ?? ""),
      secureStorageUtil.saveAccessToken(accessToken ?? ""),
    ]);

    emit(state.copyWith(
      status: AuthStatus.authenticated,
    ));
  }

  Future<void> logout() async {
    await secureStorageUtil.destroySession();

    emit(state.copyWith(
      status: AuthStatus.unauthenticated,
    ));
  }
}
