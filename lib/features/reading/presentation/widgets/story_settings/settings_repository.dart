// ignore_for_file: avoid_print

import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository {
  final SharedPreferences prefs;

  SettingsRepository({required this.prefs});

  // SharedPreferences anahtarları:
  static const String _keyTextHeight = 'text_height';
  static const String _keyFontSize = 'font_size';
  static const String _keyFontFamily = 'font_family';
  static const String _keyTextAlign = 'text_align_index';

  // Varsayılan değerler:
  double getTextHeight() => prefs.getDouble(_keyTextHeight) ?? 1.7;
  double getFontSize() => prefs.getDouble(_keyFontSize) ?? 18.0;
  String getFontFamily() => prefs.getString(_keyFontFamily) ?? 'Urbanist';

  Future<bool> setTextHeight(double height) => prefs.setDouble(_keyTextHeight, height);
  Future<bool> setFontSize(double fontSize) => prefs.setDouble(_keyFontSize, fontSize);
  Future<bool> setFontFamily(String fontFamily) => prefs.setString(_keyFontFamily, fontFamily);

  // TextAlign için okuma ve yazma metodları:
  TextAlign getTextAlign() {
    final index = prefs.getInt(_keyTextAlign) ?? TextAlign.justify.index;
    return TextAlign.values[index];
  }

  Future<bool> setTextAlign(TextAlign align) => prefs.setInt(_keyTextAlign, align.index);

  // TextStyle’ın önemli özelliklerini kaydetmek:
  Future<void> saveTextStyle(TextStyle style) async {
    try {
      await setTextHeight(style.height ?? 1.7);
      await setFontSize(style.fontSize ?? 18.0);
      if (style.fontFamily != null) {
        if (style.fontFamily?.contains("_") ?? false) {
          final first = style.fontFamily!.split("_")[0];
          await setFontFamily(first);
        }
      }
    } catch (e) {
      print("Hata $e");
    }
  }

  // SharedPreferences’den TextStyle oluşturur. GoogleFonts.getFont() ile dinamik font kullanıyoruz.
  TextStyle getTextStyle(BuildContext context) {
    try {
      return GoogleFonts.getFont(
        getFontFamily(),
        height: getTextHeight(),
        fontSize: getFontSize(),
        color: context.color.onSurface,
      );
    } catch (e) {
      return GoogleFonts.urbanist(
        height: getTextHeight(),
        fontSize: getFontSize(),
        color: context.color.onSurface,
      );
    }
  }
}
