import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:{{name.snakeCase()}}/core/localization/localization.dart';
import 'package:{{name.snakeCase()}}/global/presentation/bloc/localization_cubit.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.language ?? ""),
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
        child: Text(
          AppLocalizations.of(context)?.name ?? "",
        ),
      ),
    );
  }
}
