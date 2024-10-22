import 'package:{{name.snakeCase()}}/core/ui/app_color.dart';
import 'package:{{name.snakeCase()}}/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: FontFamily.inter,
    colorScheme: ColorScheme.light(
      primary: AppColor.light.primary,
      secondary: AppColor.light.secondary,
      tertiary: AppColor.light.tertiary,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.light.surface,
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColor.light.onSurface,
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
      ),
    ),
  );
}
