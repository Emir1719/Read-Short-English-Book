import 'package:english_will_fly/features/reading/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static final _instance = AppTheme._();

  AppTheme._();

  factory AppTheme() => _instance;

  static ThemeData get light => ThemeData(
        primaryColor: AppColor.white,
        appBarTheme: _appBarTheme(),
        scaffoldBackgroundColor: AppColor.white,
      );

  static AppBarTheme _appBarTheme() {
    return AppBarTheme(
      backgroundColor: AppColor.white,
      foregroundColor: AppColor.black,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColor.white,
        systemNavigationBarColor: AppColor.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
