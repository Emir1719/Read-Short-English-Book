import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/profile/info_icon.dart';
import 'package:english_will_fly/features/reading/util/style.dart';
import 'package:english_will_fly/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoBox extends StatelessWidget {
  const InfoBox({super.key, this.icon, required this.title, required this.value});
  final IconData? icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    bool isDark = context.read<ThemeBloc>().state.isDarkMode;

    return Row(
      children: [
        InfoIcon(icon: icon),
        SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: isDark ? AppStyle.profileInfoTitleDark : AppStyle.profileInfoTitle,
            ).tr(),
            SizedBox(height: 5),
            Text(value, style: AppStyle.profileInfoValue).tr(),
          ],
        ),
      ],
    );
  }
}
