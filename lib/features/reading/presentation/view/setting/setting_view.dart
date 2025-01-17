import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/profile/profile_auth_listener.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/setting/language_dropdown.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/setting/settings_exit_button.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/setting/theme_switch_row.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:flutter/material.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthenticationBlocListener(
      child: Scaffold(
        appBar: AppBar(title: Text('settings.title').tr(context: context)),
        body: ListView(
          padding: AppPadding.defaults,
          children: [
            LanguageDropdown(),
            SizedBox(height: 20),
            ThemeSwitchRow(),
            SizedBox(height: 20),
            SettingsExitButton(),
          ],
        ),
      ),
    );
  }
}
