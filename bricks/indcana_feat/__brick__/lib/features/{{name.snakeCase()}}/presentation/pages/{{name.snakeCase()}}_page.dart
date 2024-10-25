import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class {{name.pascalCase()}}Page extends StatelessWidget {
  const {{name.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [],
      child: const _{{name.pascalCase()}}Layout(),
    );
  }
}

class _{{name.pascalCase()}}Layout extends StatelessWidget {
  const _{{name.pascalCase()}}Layout();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("{{name.titleCase()}} Page"),
      ),
    );
  }
}

