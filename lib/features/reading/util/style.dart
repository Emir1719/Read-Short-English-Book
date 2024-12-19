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

  static BoxDecoration dictionary(bool isDark) => BoxDecoration(
        color: isDark ? AppColor.scaffoldBackgroundDark : AppColor.primary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        border: Border(top: BorderSide(color: AppColor.secondary!, width: 6)),
      );

  static BoxDecoration storyLevel(isDark) => BoxDecoration(
        color: isDark ? Colors.black.withOpacity(0.65) : Colors.white.withOpacity(0.65),
        borderRadius: BorderRadius.circular(8),
      );

  static BoxDecoration profileContainer(bool isDark) => BoxDecoration(
        color: isDark ? Colors.grey.shade900 : Colors.grey.shade100,
        border: Border(
          right: BorderSide(width: 5, color: Colors.blue),
        ),
      );

  static BoxDecoration get wordListContainer => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border(
          left: BorderSide(
            color: Colors.blue,
            width: 5,
          ),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(2, 2),
            blurRadius: 2,
            spreadRadius: 1,
            color: Colors.grey.shade300,
          ),
        ],
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

  static TextStyle get dictionaryMean => _baseText.copyWith(
        height: 1.5,
      );

  static TextStyle get storyCategoryTitle => _baseText.copyWith(
        fontSize: 15,
        color: AppColor.storyCategoryTitle,
      );

  static TextStyle get infoTitle => TextStyle(
        fontSize: 16,
        color: AppColor.profileInfoTitle,
      );

  static TextStyle get infoTitleDark => TextStyle(
        fontSize: 16,
        color: AppColor.infoTitleDark,
      );

  static TextStyle get profileInfoTitle => TextStyle(
        fontSize: 16,
        color: AppColor.profileInfoTitle,
      );

  static TextStyle get profileInfoTitleDark => TextStyle(
        fontSize: 16,
        color: AppColor.profileInfoTitleDark,
      );

  static TextStyle get profileInfoValue => TextStyle(fontSize: 18);

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

  static BoxDecoration settings(bool isDark) {
    return BoxDecoration(
      color: isDark ? AppColor.primaryDark : AppColor.settings,
      borderRadius: BorderRadius.circular(10),
    );
  }

  static Color? compliteColor(bool isDark, bool isCompleted) {
    final unCompleteColor = isDark ? AppColor.white : AppColor.black;
    final primary = isDark ? AppColor.lightGreen : AppColor.completeTask;

    return isCompleted ? primary : unCompleteColor;
  }

  static BoxDecoration categoryBox(bool isDark, bool isSelected) {
    return !isDark
        ? BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? Colors.blue.shade900 : Colors.grey.shade200,
          )
        : BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? Colors.grey.shade200 : AppColor.primaryDark,
          );
  }

  static Color? lightMode(bool isSelected) => isSelected ? AppColor.white : AppColor.black;
  static Color? darkMode(bool isSelected) => isSelected ? AppColor.black : AppColor.white;
}
