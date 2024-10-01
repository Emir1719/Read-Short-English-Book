import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings.title').tr(),
        actions: [
          PopupMenuButton<Locale>(
            onSelected: (Locale locale) {
              EasyLocalization.of(context)?.setLocale(locale); // Burada context kullanarak locale ayarlanıyor
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: Locale('en', ''),
                  child: Text('English'),
                ),
                PopupMenuItem(
                  value: Locale('tr', ''),
                  child: Text('Türkçe'),
                ),
              ];
            },
          ),
        ],
      ),
    );
  }
}
