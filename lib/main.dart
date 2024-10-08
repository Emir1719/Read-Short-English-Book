import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/reading/util/app_init.dart';
import 'package:english_will_fly/features/reading/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await AppInit.setup();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', ''), Locale('tr', '')],
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
      child: MaterialApp.router(
        title: "English Will Fly",
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        //home: const SplashView(),
        routerConfig: AppInit.route,
      ),
    );
  }
}
