import 'package:english_will_fly/features/reading/presentation/widgets/profile/profile_appbar.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/profile/profile_auth_listener.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/profile/profile_user_info.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ProfileAppBar(),
      body: AuthenticationBlocListener(
        child: ProfileUserInfo(),
      ),
    );
  }
}
