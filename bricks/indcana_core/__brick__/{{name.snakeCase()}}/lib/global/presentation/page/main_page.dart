import 'package:{{name.snakeCase()}}/core/constant/auth_constant.dart';
import 'package:{{name.snakeCase()}}/core/route/routes.dart';
import 'package:{{name.snakeCase()}}/global/presentation/bloc/auth_cubit.dart';
import 'package:{{name.snakeCase()}}/global/presentation/bloc/auth_state.dart';
import 'package:{{name.snakeCase()}}/core/localization/localization.dart';
import 'package:{{name.snakeCase()}}/global/presentation/bloc/localization_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(
          listener: (_, state) {
            if (state.status == AuthStatus.unauthenticated) {
              context.goNamed(Routes.login);
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)?.name ?? "",
          ),
          actions: [
            PopupMenuButton<Locale>(
              initialValue:
                  context.select((LocalizationCubit cubit) => cubit.state),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.language),
                    const SizedBox(width: 8),
                    Text(
                      context
                          .select((LocalizationCubit cubit) => cubit.state)
                          .languageCode
                          .toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              itemBuilder: (ctx) => Localization.supportedLocales
                  .map(
                    (e) => PopupMenuItem<Locale>(
                      value: e,
                      child: Text(e.languageCode.toUpperCase()),
                    ),
                  )
                  .toList(),
              onSelected: (locale) {
                context.read<LocalizationCubit>().changeLanguage(locale);
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)?.language ?? "",
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                child: const Text("Logout"),
                onPressed: () {
                  context.read<AuthCubit>().logout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
