import 'package:flutter/material.dart';

class SupportedLocales {
  static const Map<String, String> localeData = {
    'tr': 'Türkçe',
    'en': 'English',
    'de': 'Deutsch',
    'fr': 'French',
    'ru': 'Russian',
  };

  static List<Locale> get locales =>
      localeData.keys.map((langCode) => Locale(langCode, '')).toList();

  static Map<Locale, String> get localeNames => {
        for (var langCode in localeData.keys) Locale(langCode, ''): localeData[langCode]!,
      };
}
