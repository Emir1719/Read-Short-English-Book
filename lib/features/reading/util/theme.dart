import 'package:english_will_fly/features/reading/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static final _instance = AppTheme._();

  AppTheme._();

  factory AppTheme() => _instance;

  static ThemeData get light => ThemeData(
        primaryColor: AppColor.primary,
        appBarTheme: _appBarTheme(),
        scaffoldBackgroundColor: AppColor.primary,
        textButtonTheme: _textButtonTheme(),
      );

  static TextButtonThemeData _textButtonTheme() {
    return TextButtonThemeData(
      style: ButtonStyle(
        textStyle: const WidgetStatePropertyAll(TextStyle(fontSize: 16)),
        foregroundColor: WidgetStatePropertyAll(AppColor.secondary),
        surfaceTintColor: WidgetStatePropertyAll(AppColor.secondary),
      ),
    );
  }

  static AppBarTheme _appBarTheme() {
    return AppBarTheme(
      backgroundColor: AppColor.primary,
      foregroundColor: AppColor.black,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        color: AppColor.black,
        overflow: TextOverflow.ellipsis,
      ),
      surfaceTintColor: AppColor.secondary,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColor.primary,
        systemNavigationBarColor: AppColor.primary,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
