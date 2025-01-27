import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/setting/theme_switch.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/settings_container_base.dart';
import 'package:flutter/material.dart';

class ThemeSwitchRow extends StatelessWidget {
  const ThemeSwitchRow({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SettingsContainerBase(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              "settings.theme",
              style: textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
            ).tr(),
          ),
          ThemeSwitch(),
        ],
      ),
    );
  }
}
