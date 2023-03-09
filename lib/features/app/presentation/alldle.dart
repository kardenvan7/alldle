import 'package:alldle/di/global_scope.dart';
import 'package:alldle/features/app/application/cubits/locale_cubit.dart';
import 'package:alldle/features/app/application/cubits/theme_mode_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Alldle extends StatelessWidget {
  const Alldle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scope = GlobalScope.instance;

    final localization = scope.getAppLocalizationsFacade();
    final router = scope.getAppRouter();
    final theme = scope.getThemeFacade();
    final themeCubit = scope.getThemeModeCubit();
    final localeCubit = scope.getLocaleCubit();

    return BlocBuilder<LocaleCubit, Locale>(
      bloc: localeCubit,
      builder: (context, locale) {
        return BlocBuilder<ThemeModeCubit, ThemeMode>(
          bloc: themeCubit,
          builder: (context, mode) {
            return MaterialApp.router(
              routeInformationParser: router.routeInformationParser,
              routerDelegate: router.routerDelegate,
              title: localization.getAppTitle(locale: locale),
              theme: theme.light,
              darkTheme: theme.dark,
              themeMode: mode,
              locale: locale,
              localizationsDelegates: localization.delegates,
              supportedLocales: localization.supportedLocales,
            );
          },
        );
      },
    );
  }
}
