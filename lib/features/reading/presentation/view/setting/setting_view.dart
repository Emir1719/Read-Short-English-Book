import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/setting/language_dropdown.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/setting/theme_switch_row.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:flutter/material.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('settings.title').tr()),
      body: ListView(
        padding: AppPadding.defaults,
        children: [
          LanguageDropdown(),
          ThemeSwitchRow(),
        ],
      ),
    );
  }
}
