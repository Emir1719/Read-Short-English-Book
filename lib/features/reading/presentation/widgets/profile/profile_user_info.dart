import 'package:english_will_fly/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_state.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/profile/profile_completed_stories.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/profile/profile_word_list.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/profile_info_box.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUserInfo extends StatelessWidget {
  const ProfileUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final user = (context.read<AuthBloc>().state as Authenticated).user;
    const space = SizedBox(height: 20);

    return ListView(
      padding: AppPadding.defaults,
      children: [
        ProfileInfoBox(
          title: "profile.email",
          value: user.email,
          icon: Icons.email,
        ),
        space,
        ProfileInfoBox(
          title: "profile.age",
          value: user.age,
          icon: Icons.align_vertical_bottom_rounded,
        ),
        space,
        ProfileCompletedStories(),
        space,
        ProfileWordList(),
      ],
    );
  }
}
