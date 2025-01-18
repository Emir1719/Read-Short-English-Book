import 'package:english_will_fly/features/reading/presentation/widgets/profile/profile_word_list.dart';
import 'package:flutter/material.dart';

class ProfileUserStatus extends StatelessWidget {
  const ProfileUserStatus({super.key});

  @override
  Widget build(BuildContext context) {
    //  final stories = context.read<ReadingBloc>().stories;
    // var completedStories = stories?.where((element) => element.isCompleted);
    //  var definitions = completedStories?.expand((element) => element.definitions).toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      spacing: 10,
      children: [
        /* GestureDetector(
          onTap: () {},
          child: ProfileStatusItem(
            title: (completedStories?.length ?? 0).toString(),
            value: "profile.reading".tr(),
          ),
        ),*/
        ProfileWordList(),
        /* GestureDetector(
          onTap: () => context.push("/wordList", extra: definitions ?? []),
          child: ProfileStatusItem(
            title: "+${definitions?.length ?? 0}",
            value: "profile.words".tr(),
          ),
        ),*/
      ],
    );
  }
}
