import 'package:flutter/material.dart';

class SupportedLocales {
  static const List<Locale> locales = [
    Locale('tr', ''),
    Locale('en', ''),
    Locale('de', ''),
  ];

  static Map<Locale, String> localeNames = {
    Locale('tr', ''): 'Türkçe',
    Locale('en', ''): 'English',
    Locale('de', ''): 'Deutsch',
  };
}
