import 'package:english_will_fly/features/reading/util/color.dart';
import 'package:flutter/material.dart';

class AppStyle {
  static final instance = AppStyle._();
  AppStyle._();
  factory AppStyle() => instance;

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
