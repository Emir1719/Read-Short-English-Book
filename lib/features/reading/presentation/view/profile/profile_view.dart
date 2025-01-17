import 'package:english_will_fly/features/reading/presentation/widgets/profile/profile_appbar.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/profile/profile_background.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(),
      body: ListView(
        padding: AppPadding.defaults,
        children: [
          ProfileBackground(),
          /*SizedBox(height: 10),
            ProfileUserStatus(), // Kullanıcı durumu*/
        ],
      ),
    );
  }
}
