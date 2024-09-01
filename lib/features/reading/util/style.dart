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

  static TextStyle get levelTitle => const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      );

  static TextStyle get storyTitle => levelTitle;

  static Color levelColor(int index) {
    switch (index) {
      case 0:
        return Colors.green;
      case 1:
        return Colors.green.shade700;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.orange.shade700;
      case 4:
        return Colors.red;
      case 5:
        return Colors.red.shade700;
      default:
        return Colors.green;
    }
  }
}
