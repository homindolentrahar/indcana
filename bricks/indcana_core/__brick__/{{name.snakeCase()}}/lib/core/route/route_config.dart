import 'package:{{name.snakeCase()}}/core/route/routes.dart';
import 'package:{{name.snakeCase()}}/core/util/secure_storage_util.dart';
import 'package:{{name.snakeCase()}}/features/login/presentation/page/login_page.dart';
import 'package:{{name.snakeCase()}}/global/presentation/page/initial_page.dart';
import 'package:{{name.snakeCase()}}/global/presentation/page/main_page.dart';
import 'package:go_router/go_router.dart';

abstract class RouteConfig {
  static GoRouter router = GoRouter(
    initialLocation: Routes.initial,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      // Used for middleware or guarding the authenticated section of the app
      // Return a path to redirect if user not authenticated, or null to continue as normal

      return null;
    },
    routes: [
      GoRoute(
        path: Routes.initial,
        name: Routes.initial,
        redirect: (context, state) async {
          final isAuthenticated =
              (await SecureStorageUtil.instance.accessToken) != null;

          if (isAuthenticated) {
            return Routes.home;
          }
          return Routes.login;
        },
        builder: (ctx, state) => const InitialPage(),
      ),
      GoRoute(
        path: Routes.home,
        name: Routes.home,
        builder: (ctx, state) => const MainPage(),
      ),
      GoRoute(
        path: Routes.login,
        name: Routes.login,
        builder: (ctx, state) => const LoginPage(),
      ),
    ],
  );
}
