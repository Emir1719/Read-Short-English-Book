import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/profile/info_icon.dart';
import 'package:english_will_fly/features/reading/util/style.dart';
import 'package:flutter/material.dart';

class InfoBox extends StatelessWidget {
  const InfoBox({super.key, this.icon, required this.title, required this.value});
  final IconData? icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InfoIcon(icon: icon),
        SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppStyle.profileInfoTitle).tr(),
            SizedBox(height: 5),
            Text(value, style: AppStyle.profileInfoValue).tr(),
          ],
        ),
      ],
    );
  }
}
