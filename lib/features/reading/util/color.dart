import 'package:flutter/material.dart';

class AppColor {
  static final _instance = AppColor._();

  AppColor._();

  factory AppColor() => _instance;

  // colors of the project
  static Color? get black => Colors.black;
  static Color? get white => Colors.white;

  // levels
  static Color? get a1 => Colors.green;
  static Color? get a2 => Colors.green.shade700;
  static Color? get b1 => Colors.orange;
  static Color? get b2 => Colors.orange.shade700;
  static Color? get c1 => Colors.red;
  static Color? get c2 => Colors.red.shade700;

  // for widgets
  static Color? get text => black;
}
