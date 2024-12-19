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
        switchTheme: _switchTheme(),
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
        scaffoldBackgroundColor: AppColor.scaffoldBackgroundDark,
        textButtonTheme: _textButtonTheme(
          fontColor: AppColor.white,
          secondary: AppColor.secondaryDark,
        ),
        textTheme: _textTheme(fontColor: AppColor.white),
        listTileTheme: _listTileTheme(fontColor: AppColor.white),
        inputDecorationTheme: _inputDecorationTheme(
          borderColor: AppColor.grey,
          fontColor: AppColor.white,
        ),
        elevatedButtonTheme: _elevatedButtonTheme(
          primary: AppColor.primaryDark,
          secondary: AppColor.secondaryDark,
          surfaceTintColor: Colors.transparent,
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: AppColor.secondaryDark,
        ),
        switchTheme: _switchTheme(
          trackColor: AppColor.scaffoldBackgroundDark,
          thumbColor: AppColor.white,
        ),
      );

  static SwitchThemeData _switchTheme({Color? trackColor, Color? thumbColor}) {
    return SwitchThemeData(
      trackColor: WidgetStatePropertyAll(trackColor ?? AppColor.primary),
      thumbColor: WidgetStatePropertyAll(thumbColor ?? AppColor.black),
    );
  }

  static BottomNavigationBarThemeData _bottomNavigationBarTheme({
    Color? primary,
    Color? selectedItemColor,
    Color? unSelectedItemColor,
  }) {
    return BottomNavigationBarThemeData(
      backgroundColor: primary ?? AppColor.primary,
      selectedItemColor: selectedItemColor ?? AppColor.black,
      unselectedItemColor: unSelectedItemColor ?? AppColor.bottomUnselected,
    );
  }

  static ElevatedButtonThemeData _elevatedButtonTheme(
      {Color? primary, Color? secondary, Color? surfaceTintColor}) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        fixedSize: const WidgetStatePropertyAll(Size.fromHeight(55)),
        textStyle: WidgetStatePropertyAll(_textTheme().bodyMedium),
        backgroundColor: WidgetStatePropertyAll(primary ?? AppColor.primary),
        foregroundColor: WidgetStatePropertyAll(secondary ?? AppColor.secondary),
        surfaceTintColor: WidgetStatePropertyAll(surfaceTintColor ?? AppColor.secondary),
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

  static InputDecorationTheme _inputDecorationTheme({Color? borderColor, Color? fontColor}) {
    var radius = const BorderRadius.all(Radius.circular(8));
    var border = borderColor ?? AppColor.black!;

    return InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: radius,
        borderSide: BorderSide(color: border),
      ),
      labelStyle: _textTheme(fontColor: fontColor).bodyMedium,
      focusedBorder: OutlineInputBorder(
        borderRadius: radius,
        borderSide: BorderSide(color: border, width: 2),
      ),
    );
  }

  static ListTileThemeData _listTileTheme({Color? fontColor}) {
    return ListTileThemeData(
      titleTextStyle: _textTheme(fontColor: fontColor).bodyMedium,
      subtitleTextStyle: _textTheme(fontColor: fontColor).bodySmall,
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
      titleLarge: base.copyWith(fontSize: 20, fontWeight: FontWeight.w500),
      titleMedium: base.copyWith(fontSize: 18, fontWeight: FontWeight.w500),

      // label
      labelMedium: base.copyWith(fontSize: 16),
    );
  }

  static TextButtonThemeData _textButtonTheme({Color? secondary, Color? fontColor}) {
    return TextButtonThemeData(
      style: ButtonStyle(
        fixedSize: const WidgetStatePropertyAll(Size.fromHeight(55)),
        textStyle: WidgetStatePropertyAll(
          _textTheme(fontColor: fontColor ?? AppColor.white).bodyMedium,
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
      titleTextStyle: _textTheme(fontColor: fontColor ?? AppColor.black).titleLarge,
      surfaceTintColor: primary ?? AppColor.primary,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: primary ?? AppColor.primary,
        systemNavigationBarColor: primary ?? AppColor.primary,
        systemNavigationBarIconBrightness: primary == null ? Brightness.dark : Brightness.light,
        statusBarIconBrightness: primary == null ? Brightness.dark : Brightness.light,
      ),
    );
  }
}
