import 'package:mason/mason.dart';

abstract class HookUtils {
  static String getApplicationId({
    required String organization,
    required String name,
  }) {
    return "${organization.dotCase}.${name.snakeCase}";
  }
}
