import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/info_box.dart';
import 'package:english_will_fly/features/reading/util/color.dart';
import 'package:english_will_fly/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class StoryDetail extends StatelessWidget {
  const StoryDetail({super.key, required this.story});
  final Story story;

  @override
  Widget build(BuildContext context) {
    bool isDark = context.read<ThemeBloc>().state.isDarkMode;

    return Container(
      color: isDark ? AppColor.storyDetailDark : AppColor.storyDetail,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InfoBox(title: "home.level", value: story.level.toUpperCase(), icon: Icons.analytics),
          GestureDetector(
            onTap: () => context.push("/wordList", extra: story.definitions),
            child: InfoBox(
              title: "home.newWords",
              value: story.definitions.length.toString(),
              icon: Icons.add_home_rounded,
            ),
          ),
        ],
      ),
    );
  }
}
