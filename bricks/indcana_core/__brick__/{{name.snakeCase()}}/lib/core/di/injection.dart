import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final injector = GetIt.instance;

abstract class Injection {
  static Future<void> inject() async {
    // Declare global dependencies here
    injector.registerSingletonAsync(() => SharedPreferences.getInstance());
  }
}
