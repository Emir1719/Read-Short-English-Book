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

  static BoxDecoration get dictionary => BoxDecoration(
        color: AppColor.primary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        border: Border(top: BorderSide(color: AppColor.secondary!, width: 6)),
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

  static TextStyle get dictionaryWord => levelTitle;

  static TextStyle get dictionaryMean => _baseText;

  static TextStyle get storyCategoryTitle => _baseText.copyWith(
        fontSize: 15,
        color: Colors.blue.shade900,
      );

  static Color? levelColor(String level) {
    switch (level) {
      case "a1":
        return AppColor.a1;
      case "a2":
        return AppColor.a2;
      case "b1":
        return AppColor.b1;
      case "b2":
        return AppColor.b2;
      case "c1":
        return AppColor.c1;
      case "c2":
        return AppColor.c2;
      default:
        return AppColor.a1;
    }
  }

  static Color? compliteColor(bool isCompleted) {
    return isCompleted ? Colors.green : Colors.black;
  }
}
