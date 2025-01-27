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

  static BoxDecoration storyLevel(Color? color) => BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      );

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
}
