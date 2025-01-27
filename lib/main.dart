import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/core/constants/suported_locales.dart';
import 'package:english_will_fly/features/reading/util/app_init.dart';
import 'package:english_will_fly/features/theme/data/app_color_scheme.dart';
import 'package:english_will_fly/features/theme/data/app_theme.dart';
import 'package:english_will_fly/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await AppInit.setup();

  runApp(
    EasyLocalization(
      supportedLocales: SupportedLocales.locales,
      path: 'assets/translations',
      fallbackLocale: Locale('en', ''),
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppInit.getBlocProviders(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: "English Will Fly",
            debugShowCheckedModeBanner: false,
            themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            theme: AppThemeNew(AppColorScheme.light).theme(),
            darkTheme: AppThemeNew(AppColorScheme.dark).theme(),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            routerConfig: AppInit.route,
          );
        },
      ),
    );
  }
}
