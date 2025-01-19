import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class AppTranslator {
  final GoogleTranslator translator;

  AppTranslator(this.translator);

  Future<String> translate(BuildContext context, String text) async {
    var translation = await translator.translate(text, from: "en", to: context.locale.languageCode);
    return translation.text;
  }
}
