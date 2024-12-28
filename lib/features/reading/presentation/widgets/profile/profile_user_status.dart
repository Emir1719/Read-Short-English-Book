import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/profile/profile_status_item.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/profile/profile_word_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileUserStatus extends StatelessWidget {
  const ProfileUserStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final stories = context.read<ReadingBloc>().stories;
    var completedStories = stories?.where((element) => element.isCompleted);
    var definitions = completedStories?.expand((element) => element.definitions).toList();

    return Row(
      spacing: 10,
      children: [
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {},
            child: ProfileStatusItem(
              title: (completedStories?.length ?? 0).toString(),
              value: "profile.reading".tr(),
            ),
          ),
        ),
        ProfileWordList(),
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () => context.push("/wordList", extra: definitions ?? []),
            child: ProfileStatusItem(
              title: "+${definitions?.length ?? 0}",
              value: "profile.words".tr(),
            ),
          ),
        ),
      ],
    );
  }
}
