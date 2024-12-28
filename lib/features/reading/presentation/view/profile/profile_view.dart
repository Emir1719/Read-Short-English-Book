import 'package:english_will_fly/features/reading/presentation/widgets/profile/profile_appbar.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/profile/profile_auth_listener.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/profile/profile_avatar.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/profile/profile_background.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/profile/profile_user_email.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/profile/profile_user_status.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(),
      body: AuthenticationBlocListener(
        child: Padding(
          padding: AppPadding.defaults,
          child: Column(
            children: [
              Spacer(flex: 1),
              Stack(
                alignment: Alignment.topCenter, // Üst merkeze hizalama
                clipBehavior: Clip.none, // Taşmayı engelleme
                children: [
                  ProfileBackground(),
                  Positioned(top: -55, left: 0, right: 0, child: ProfileAvatar()),
                  Positioned(top: 80, child: ProfileUserEmail()),
                ],
              ),
              SizedBox(height: 10),
              ProfileUserStatus(), // Kullanıcı durumu
              Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
