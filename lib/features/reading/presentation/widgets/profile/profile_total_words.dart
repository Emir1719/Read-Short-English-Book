import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/profile_info_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileTotalWords extends StatelessWidget {
  const ProfileTotalWords({super.key});

  @override
  Widget build(BuildContext context) {
    final stories = context.read<ReadingBloc>().stories;
    var completedStories = stories?.where((element) => element.isLiked);
    var definitions = completedStories?.expand((element) => element.definitions).toList();

    return GestureDetector(
      onTap: () => context.push("/wordList", extra: definitions ?? []),
      child: ProfileInfoBox(
        title: "profile.words",
        value: "+${definitions?.length ?? 0}",
        icon: Icons.add_home_rounded,
      ),
    );
  }
}
