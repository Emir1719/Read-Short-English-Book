import 'package:english_will_fly/features/reading/presentation/widgets/profile/profile_avatar.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/profile/profile_user_email.dart';
import 'package:english_will_fly/features/reading/util/style.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';

class ProfileBackground extends StatelessWidget {
  const ProfileBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      width: context.width(),
      decoration: AppStyle.settingsItem(context.isDark),
      child: Row(
        spacing: 15,
        children: [
          ProfileAvatar(),
          ProfileUserEmail(),
        ],
      ),
    );
  }
}
