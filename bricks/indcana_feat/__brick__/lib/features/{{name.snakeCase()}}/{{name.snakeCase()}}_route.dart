import 'package:go_router/go_router.dart';
import '{{name.snakeCase()}}_module.dart';
import 'presentation/pages/{{name.snakeCase()}}_page.dart';

abstract class {{name.pascalCase()}}Route {
  const String path = "/{{name.paramCase()}}";

  GoRoute route = GoRoute(
    path: path,
    name: path,
    onExit: (context, state) {
      {{name.pascalCase()}}Module.dispose();

      return true;
    },
    builder: (context, state) {
      {{name.pascalCase()}}Module.inject();

      return const {{name.pascalCase()}}Page();
    },
  );
}
