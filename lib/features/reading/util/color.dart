import 'package:flutter/material.dart';

class AppColor {
  static final _instance = AppColor._();
  AppColor._();
  factory AppColor() => _instance;

  // Light
  static Color? get primary => Colors.white;
  static Color? get secondary => Colors.blue;

  // Dark
  static Color? get primaryDark => Colors.grey.shade900;
  static Color? get scaffoldBackgroundDark => Colors.grey.shade800;
  static Color? get secondaryDark => Colors.blue;

  // Colors
  static Color? get black => Colors.black;
  static Color? get white => Colors.white;
  static Color? get lightBlue => const Color.fromARGB(255, 142, 219, 255);
  static Color? get grey => Colors.grey;
  static Color? get lightGreen => const Color.fromARGB(255, 35, 255, 46);

  // For widgets
  static Color? get text => black;
  static Color? get profileInfoBack => Colors.blue.shade400;
  static Color? get profileInfoFront => primary;
  static Color? get completeTask => Colors.green;
  static Color? get storyCategoryTitle => Colors.blue.shade900;
  static Color? get profileInfoTitle => Colors.grey.shade600;
  static Color? get infoTitleDark => Colors.grey.shade300;
  static Color? get settings => Colors.grey.shade200;
  static Color? get profileInfoTitleDark => Colors.grey.shade300;
  static Color? get storyDetail => Colors.grey.shade200;
  static Color? get storyDetailDark => primaryDark;
  static Color? get bottomUnselected => Colors.grey.shade700;
  static Color? get example => Colors.red.shade600;
  static Color? get exampleDark => Colors.deepOrange.shade400;
  static Color? get snackbar => Colors.grey.shade100;
}
