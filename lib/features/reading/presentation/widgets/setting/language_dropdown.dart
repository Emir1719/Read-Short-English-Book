import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageDropdown extends StatelessWidget {
  const LanguageDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Locale>(
      value: EasyLocalization.of(context)?.locale, // Mevcut locale ayarını seçili olarak göster
      onChanged: (Locale? locale) {
        if (locale != null) {
          EasyLocalization.of(context)?.setLocale(locale); // Yeni locale ayarını güncelle
        }
      },
      underline: SizedBox(),
      dropdownColor: Colors.white,
      isExpanded: true, style: TextStyle(fontSize: 16, color: Colors.black),
      items: [
        DropdownMenuItem(
          value: Locale('en', ''),
          child: Text('English'),
        ),
        DropdownMenuItem(
          value: Locale('tr', ''),
          child: Text('Türkçe'),
        ),
      ],
    );
  }
}
