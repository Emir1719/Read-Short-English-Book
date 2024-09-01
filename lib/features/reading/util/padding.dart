import 'package:flutter/material.dart';

class AppPadding {
  static final instance = AppPadding._();

  AppPadding._();

  factory AppPadding() => instance;

  static EdgeInsets get defaults => const EdgeInsets.all(20);
}
