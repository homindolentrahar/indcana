import 'package:flutter/material.dart';
import 'package:superseed/app.dart';
import 'package:superseed/environment.dart';
import 'package:superseed/core/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Environment.setFlavor(EnvFlavor.staging);

  await Injection.inject();

  runApp(const Application());
}
