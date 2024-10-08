import 'package:english_will_fly/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:english_will_fly/features/auth/presentation/bloc/auth_state.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/word_list/word_list_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/profile_info_box.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final user =
        (BlocProvider.of<AuthenticationBloc>(context).state as AuthenticationAuthenticated).user;
    final stories = context.read<ReadingBloc>().stories;
    var completedStories = stories?.where((element) => element.isCompleted);
    var definitions = completedStories?.expand((element) => element.definitions).toList();
    const space = SizedBox(height: 20);

    var wordList = context.read<WordListBloc>().wordList;

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
        ProfileInfoBox(
          title: "profile.reading",
          value: (completedStories?.length ?? 0).toString(),
          icon: Icons.add_task_sharp,
        ),
        space,
        GestureDetector(
          onTap: () => context.push("/wordList", extra: definitions ?? []),
          child: ProfileInfoBox(
            title: "profile.words",
            value: "+${definitions?.length ?? 0}",
            icon: Icons.add_home_rounded,
          ),
        ),
        space,
        GestureDetector(
          onTap: () => context.push("/wordList", extra: wordList?.words ?? []),
          child: ProfileInfoBox(
            title: "profile.word_list",
            value: "${wordList?.words.length ?? 0}",
            icon: Icons.workspaces_filled,
          ),
        ),
      ],
    );
  }
}
