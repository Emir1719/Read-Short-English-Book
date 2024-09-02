import 'package:english_will_fly/features/reading/util/color.dart';
import 'package:flutter/material.dart';

class AppStyle {
  static final instance = AppStyle._();

  AppStyle._();

  factory AppStyle() => instance;

  static BoxDecoration get level => BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      );

  static TextStyle get _baseText => TextStyle(
        color: AppColor.text,
        fontWeight: FontWeight.normal,
        fontSize: 16,
        overflow: TextOverflow.ellipsis,
        fontStyle: FontStyle.normal,
      );

  static TextStyle get levelTitle => _baseText.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 18,
      );

  static TextStyle get storyTitle => levelTitle;

  static Color? levelColor(int index) {
    switch (index) {
      case 0:
        return AppColor.a1;
      case 1:
        return AppColor.a2;
      case 2:
        return AppColor.b1;
      case 3:
        return AppColor.b2;
      case 4:
        return AppColor.c1;
      case 5:
        return AppColor.c2;
      default:
        return AppColor.a1;
    }
  }
}
