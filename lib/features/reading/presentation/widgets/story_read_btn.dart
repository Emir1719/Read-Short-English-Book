import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:english_will_fly/features/reading/util/color.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:english_will_fly/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoryReadButton extends StatelessWidget {
  const StoryReadButton({super.key, required this.story});
  final Story story;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadingBloc, ReadingState>(
      builder: (context, state) {
        var complete = state is ReadingLoaded &&
            state.stories.firstWhere((element) => element.id == story.id).isLiked;

        return Padding(
          padding: AppPadding.defaults,
          child: TextButton.icon(
            onPressed: _onTab(state, complete, context),
            label: _label(state, complete, context), // Default label
            icon: complete
                ? Icon(
                    Icons.check_circle_outline_rounded,
                    color: readBtnTextColor(complete, context),
                  )
                : null,
          ),
        );
      },
    );
  }

  void Function()? _onTab(ReadingState state, bool complete, BuildContext context) {
    if (complete) {
      return null;
    }

    return state is ReadingLoading
        ? null // Disable the button while loading
        : () {
            context.read<ReadingBloc>().add(StoryToggleLiked(
                  storyId: story.id.toString(),
                  levelCode: story.level.toLowerCase(),
                ));
          };
  }

  Widget _label(ReadingState state, bool complete, BuildContext context) {
    return state is ReadingLoading
        ? const CircularProgressIndicator() // Show loading indicator
        : Text(
            "home.readStatus",
            style: TextStyle(
              color: readBtnTextColor(complete, context),
            ),
          ).tr();
  }

  Color? readBtnTextColor(bool complete, BuildContext context) {
    bool isDark = context.read<ThemeBloc>().state.isDarkMode;
    final secondary = isDark ? AppColor.lightBlue : AppColor.secondary;
    final primary = isDark ? AppColor.lightGreen : AppColor.completeTask;

    return complete ? primary : secondary;
  }
}
