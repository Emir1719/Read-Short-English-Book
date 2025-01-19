import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/profile_info_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCompletedStories extends StatelessWidget {
  const ProfileCompletedStories({super.key});

  @override
  Widget build(BuildContext context) {
    final stories = context.read<ReadingBloc>().stories;
    var completedStories = stories?.where((element) => element.isLiked);

    return ProfileInfoBox(
      title: "profile.reading",
      value: (completedStories?.length ?? 0).toString(),
      icon: Icons.add_task_sharp,
    );
  }
}
