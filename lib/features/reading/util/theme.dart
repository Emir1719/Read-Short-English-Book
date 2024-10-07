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
        textTheme: _textTheme(),
        listTileTheme: _listTileTheme(),
        inputDecorationTheme: _inputDecorationTheme(),
        elevatedButtonTheme: _elevatedButtonTheme(),
      );

  static ElevatedButtonThemeData _elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        fixedSize: const WidgetStatePropertyAll(Size.fromHeight(55)),
        textStyle: const WidgetStatePropertyAll(TextStyle(fontSize: 16)),
        backgroundColor: WidgetStatePropertyAll(AppColor.primary),
        foregroundColor: WidgetStatePropertyAll(AppColor.secondary),
        surfaceTintColor: WidgetStatePropertyAll(AppColor.secondary),
        shape: _buttonShape(),
      ),
    );
  }

  static WidgetStatePropertyAll<OutlinedBorder?> _buttonShape() {
    return const WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );
  }

  static InputDecorationTheme _inputDecorationTheme() {
    var radius = const BorderRadius.all(Radius.circular(8));

    return InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: radius,
        borderSide: BorderSide(color: AppColor.black!),
      ),
      labelStyle: TextStyle(fontSize: 16, color: AppColor.black),
      focusedBorder: OutlineInputBorder(
        borderRadius: radius,
        borderSide: BorderSide(color: AppColor.black!, width: 2),
      ),
    );
  }

  static ListTileThemeData _listTileTheme() {
    return ListTileThemeData(
      titleTextStyle: TextStyle(fontSize: 16, color: AppColor.black!),
      subtitleTextStyle: TextStyle(fontSize: 15, color: AppColor.black!),
    );
  }

  static TextTheme _textTheme() {
    return const TextTheme(
      // body style
      bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(fontSize: 16),
      bodySmall: TextStyle(fontSize: 14),

      // title
      titleLarge: TextStyle(fontSize: 24),

      // label
      labelMedium: TextStyle(fontSize: 16),
    );
  }

  static TextButtonThemeData _textButtonTheme() {
    return TextButtonThemeData(
      style: ButtonStyle(
        fixedSize: const WidgetStatePropertyAll(Size.fromHeight(55)),
        textStyle: const WidgetStatePropertyAll(TextStyle(fontSize: 16)),
        foregroundColor: WidgetStatePropertyAll(AppColor.secondary),
        surfaceTintColor: WidgetStatePropertyAll(AppColor.secondary),
        shape: _buttonShape(),
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
