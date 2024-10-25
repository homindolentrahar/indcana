import 'package:superseed/core/route/routes.dart';
import 'package:superseed/core/util/secure_storage_util.dart';
import 'package:superseed/features/home/presentation/pages/home_page.dart';
import 'package:superseed/features/login/presentation/page/login_page.dart';
import 'package:superseed/features/users/presentation/pages/users_page.dart';
import 'package:superseed/features/users/users_module.dart';
import 'package:superseed/global/presentation/page/initial_page.dart';
import 'package:superseed/global/presentation/page/main_page.dart';
import 'package:go_router/go_router.dart';

abstract class RouteConfig {
  static GoRouter router = GoRouter(
    initialLocation: Routes.initial,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Routes.initial,
        name: Routes.initial,
        builder: (ctx, state) => const InitialPage(),
      ),
      ShellRoute(
        redirect: (ctx, state) async {
          // Used for middleware or guarding the authenticated section of the app
          // Return a path to redirect if user not authenticated, or null to continue as normal

          final isAuthenticated =
              (await SecureStorageUtil.instance.accessToken) != null;

          if (!isAuthenticated) {
            return Routes.login;
          }
          return null;
        },
        builder: (ctx, state, child) => child,
        routes: [
          ShellRoute(
            builder: (ctx, state, child) => MainPage(child: child),
            routes: [
              GoRoute(
                path: Routes.home,
                name: Routes.home,
                pageBuilder: (ctx, state) =>
                    const NoTransitionPage(child: HomePage()),
              ),
              GoRoute(
                path: Routes.users,
                name: Routes.users,
                pageBuilder: (ctx, state) {
                  UsersModule.inject();

                  return const NoTransitionPage(child: UsersPage());
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: Routes.login,
        name: Routes.login,
        builder: (ctx, state) => const LoginPage(),
      ),
    ],
  );
}
