import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:english_will_fly/features/reading/util/color.dart';
import 'package:english_will_fly/features/reading/util/style.dart';
import 'package:english_will_fly/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoryItemSubtitle extends StatelessWidget {
  const StoryItemSubtitle({super.key, required this.story});
  final Story story;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    bool isDark = context.read<ThemeBloc>().state.isDarkMode;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          story.category.title,
          style: textTheme.bodyMedium?.copyWith(
            color: isDark ? AppColor.lightBlue : AppColor.storyCategoryTitle,
          ),
        ).tr(),
        Icon(
          Icons.check_circle_outline_outlined,
          size: 20,
          color: AppStyle.compliteColor(isDark, story.isLiked),
        ),
      ],
    );
  }
}
