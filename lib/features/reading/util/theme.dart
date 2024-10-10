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
        bottomNavigationBarTheme: _bottomNavigationBarTheme(),
        scaffoldBackgroundColor: AppColor.primary,
        textButtonTheme: _textButtonTheme(),
        textTheme: _textTheme(),
        listTileTheme: _listTileTheme(),
        inputDecorationTheme: _inputDecorationTheme(),
        elevatedButtonTheme: _elevatedButtonTheme(),
      );

  static ThemeData get dark => ThemeData(
        primaryColor: AppColor.primaryDark,
        appBarTheme: _appBarTheme(
          primary: AppColor.primaryDark,
          secondary: AppColor.primaryDark, // surface tint efekti olmasın
          fontColor: AppColor.white,
        ),
        bottomNavigationBarTheme: _bottomNavigationBarTheme(
          primary: AppColor.primaryDark,
          selectedItemColor: AppColor.white,
          unSelectedItemColor: AppColor.grey,
        ),
        bottomAppBarTheme: BottomAppBarTheme(color: AppColor.primaryDark),
        scaffoldBackgroundColor: AppColor.scaffoldBackgroundDark,
        textButtonTheme: _textButtonTheme(
          fontColor: AppColor.white,
          secondary: AppColor.secondaryDark,
        ),
        textTheme: _textTheme(fontColor: AppColor.white),
        listTileTheme: _listTileTheme(fontColor: AppColor.white),
        inputDecorationTheme: _inputDecorationTheme(),
        elevatedButtonTheme: _elevatedButtonTheme(
          primary: AppColor.primaryDark,
          secondary: AppColor.secondaryDark,
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: AppColor.secondaryDark,
        ),
      );

  static BottomNavigationBarThemeData _bottomNavigationBarTheme({
    Color? primary,
    Color? selectedItemColor,
    Color? unSelectedItemColor,
  }) {
    return BottomNavigationBarThemeData(
      backgroundColor: primary ?? AppColor.primary,
      selectedItemColor: selectedItemColor ?? AppColor.black,
      unselectedItemColor: unSelectedItemColor ?? AppColor.black,
    );
  }

  static ElevatedButtonThemeData _elevatedButtonTheme({Color? primary, Color? secondary}) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        fixedSize: const WidgetStatePropertyAll(Size.fromHeight(55)),
        textStyle: const WidgetStatePropertyAll(TextStyle(fontSize: 16)),
        backgroundColor: WidgetStatePropertyAll(primary ?? AppColor.primary),
        foregroundColor: WidgetStatePropertyAll(secondary ?? AppColor.secondary),
        surfaceTintColor: WidgetStatePropertyAll(secondary ?? AppColor.secondary),
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

  static ListTileThemeData _listTileTheme({Color? fontColor}) {
    return ListTileThemeData(
      titleTextStyle: TextStyle(fontSize: 16, color: fontColor ?? AppColor.black!),
      subtitleTextStyle: TextStyle(fontSize: 15, color: fontColor ?? AppColor.black!),
    );
  }

  static TextTheme _textTheme({Color? fontColor}) {
    final base = TextStyle(
      overflow: TextOverflow.ellipsis,
      color: fontColor ?? AppColor.black,
    );

    return TextTheme(
      // body style
      bodyLarge: base.copyWith(fontSize: 18),
      bodyMedium: base.copyWith(fontSize: 16),
      bodySmall: base.copyWith(fontSize: 14),

      // title
      titleLarge: base.copyWith(fontSize: 18, fontWeight: FontWeight.w500),

      // label
      labelMedium: TextStyle(fontSize: 16),
    );
  }

  static TextButtonThemeData _textButtonTheme({Color? secondary, Color? fontColor}) {
    return TextButtonThemeData(
      style: ButtonStyle(
        fixedSize: const WidgetStatePropertyAll(Size.fromHeight(55)),
        textStyle: WidgetStatePropertyAll(
          TextStyle(fontSize: 16, color: fontColor ?? AppColor.white),
        ),
        foregroundColor: WidgetStatePropertyAll(secondary ?? AppColor.secondary),
        surfaceTintColor: WidgetStatePropertyAll(secondary ?? AppColor.secondary),
        shape: _buttonShape(),
      ),
    );
  }

  static AppBarTheme _appBarTheme({Color? primary, Color? secondary, Color? fontColor}) {
    return AppBarTheme(
      backgroundColor: primary ?? AppColor.primary,
      foregroundColor: fontColor ?? AppColor.black,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        color: fontColor ?? AppColor.black,
        overflow: TextOverflow.ellipsis,
      ),
      surfaceTintColor: secondary ?? AppColor.secondary,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: primary ?? AppColor.primary,
        systemNavigationBarColor: primary ?? AppColor.primary,
        systemNavigationBarIconBrightness: primary == null ? Brightness.dark : Brightness.light,
        statusBarIconBrightness: primary == null ? Brightness.dark : Brightness.light,
      ),
    );
  }
}
