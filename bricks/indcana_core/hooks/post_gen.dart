import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  final name = context.vars['name'];

  final getDependencies = context.logger.progress("Getting dependencies...");

  await Process.run("flutter", ["pub", "get"], runInShell: true);
  getDependencies.complete();

  context.logger.success('$name is ready to go! 🚀');
}
