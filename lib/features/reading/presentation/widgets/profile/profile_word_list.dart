import 'package:english_will_fly/features/reading/presentation/bloc/word_list/word_list_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/profile_info_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileWordList extends StatelessWidget {
  const ProfileWordList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WordListBloc, WordListState>(
      builder: (context, state) {
        if (state is WordListLoaded) {
          var wordList = state.wordList;

          return GestureDetector(
            onTap: () => context.push("/wordList", extra: wordList?.words ?? []),
            child: ProfileInfoBox(
              title: "profile.word_list",
              value: "${wordList?.words.length ?? 0}",
              icon: Icons.workspaces_filled,
            ),
          );
        } else if (state is WordListLoading) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ProfileInfoBox(
            title: "profile.word_list",
            value: "0",
            icon: Icons.workspaces_filled,
          );
        }
      },
    );
  }
}
