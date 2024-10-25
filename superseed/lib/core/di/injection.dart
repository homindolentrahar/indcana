import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:superseed/core/util/secure_storage_util.dart';
import 'package:superseed/core/api/api_service.dart';

final injector = GetIt.instance;

abstract class Injection {
  static Future<void> inject() async {
    // Declare global dependencies here
    injector.registerLazySingletonAsync(() => SharedPreferences.getInstance());
    injector.registerLazySingleton(() => const FlutterSecureStorage());

    // Global utils
    injector.registerLazySingleton(() => SecureStorageUtil.instance);

    // Global Service
    injector.registerLazySingletonAsync(() => ApiService.create());
  }
}
