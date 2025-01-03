import 'package:flutter/material.dart';

class AppPadding {
  static final instance = AppPadding._();

  AppPadding._();

  factory AppPadding() => instance;

  static EdgeInsets get defaults => const EdgeInsets.all(20);

  static EdgeInsets get storyItem => const EdgeInsets.all(15);

  static EdgeInsets get storyLevel => const EdgeInsets.symmetric(horizontal: 20);

  static EdgeInsets get categoryIn => EdgeInsets.symmetric(horizontal: 15, vertical: 0);

  static EdgeInsets get categoryInMargin => EdgeInsets.symmetric(horizontal: 5);

  static EdgeInsets get categoryOut => EdgeInsets.symmetric(horizontal: 15, vertical: 8);
}
