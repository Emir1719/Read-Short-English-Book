import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/word_list/word_list_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/profile/profile_status_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileWordList extends StatelessWidget {
  const ProfileWordList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WordListBloc, WordListState>(
      builder: (context, state) {
        String title;
        List<String> words = [];

        if (state is WordListLoaded) {
          title = "${state.wordList?.words.length ?? 0}";
          words = state.wordList?.words ?? [];
        } else if (state is WordListLoading) {
          title = "...";
        } else {
          title = "0";
        }

        return GestureDetector(
          onTap: state is WordListLoaded ? () => context.push("/wordList", extra: words) : null,
          child: Expanded(
            flex: 1,
            child: ProfileStatusItem(
              title: title,
              value: "profile.word_list".tr(),
            ),
          ),
        );
      },
    );
  }
}
