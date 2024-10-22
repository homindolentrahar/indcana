import 'package:{{name.snakeCase()}}/core/di/injection.dart';
import 'package:{{name.snakeCase()}}/core/route/routes.dart';
import 'package:{{name.snakeCase()}}/core/util/secure_storage_util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Login Page"),
            const SizedBox(height: 32),
            ElevatedButton(
              child: const Text("Login"),
              onPressed: () {
                injector
                    .get<SecureStorageUtil>()
                    .saveAccessToken("dslkjfhsja;");

                context.goNamed(Routes.home);
              },
            ),
          ],
        ),
      ),
    );
  }
}
