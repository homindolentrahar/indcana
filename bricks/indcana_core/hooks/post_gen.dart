import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  final name = context.vars['name'];
  final workingDirectory = "$name/";

  final getDependencies = context.logger.progress("Getting dependencies...");
  await Process.run(
    "flutter",
    ["pub", "get"],
    runInShell: true,
    workingDirectory: workingDirectory,
  );
  getDependencies.complete();

  final generateLauncherIcon = context.logger.progress(
    "Generate launcher icon...",
  );
  await Process.run(
    "dart",
    ["run", "flutter_launcher_icons"],
    runInShell: true,
    workingDirectory: workingDirectory,
  );
  generateLauncherIcon.complete();

  final generateCode = context.logger.progress(
    "Generate codes...",
  );
  await Process.run(
    "dart ",
    ["run", "build_runner", "build", "-d"],
    runInShell: true,
    workingDirectory: workingDirectory,
  );
  generateCode.complete();

  context.logger.success('$name is ready to go! 🚀');
}
