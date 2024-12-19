import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/setting/theme_switch.dart';
import 'package:english_will_fly/features/reading/util/style.dart';
import 'package:english_will_fly/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeSwitchRow extends StatelessWidget {
  const ThemeSwitchRow({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    bool isDark = context.read<ThemeBloc>().state.isDarkMode;

    return Container(
      decoration: AppStyle.settings(isDark),
      padding: EdgeInsets.all(10),
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
