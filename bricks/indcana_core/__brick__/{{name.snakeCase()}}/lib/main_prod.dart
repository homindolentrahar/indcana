import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/app.dart';
import 'package:{{name.snakeCase()}}/environment.dart';
import 'package:{{name.snakeCase()}}/core/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Environment.setFlavor(EnvFlavor.prod);

  await Injection.inject();

  runApp(const Application());
}
