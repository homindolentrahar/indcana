import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  final immutable = context.vars['immutable'] as String;

  if (immutable == 'freezed') {
    final generateCodeProgress = context.logger.progress("Generating code...");
    await Process.run(
      "dart",
      ["run", "build_runner", "build", "-d"],
      runInShell: true,
    );
    generateCodeProgress.complete();
  }
}
