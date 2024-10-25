import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/app.dart';
import 'package:{{name.snakeCase()}}/core/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Injection.inject();

  runApp(const Application());
}
