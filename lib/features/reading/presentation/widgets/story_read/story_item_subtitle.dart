import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';

class StoryItemSubtitle extends StatelessWidget {
  const StoryItemSubtitle({super.key, required this.story});
  final Story story;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Text(
      story.category.title,
      style: textTheme.bodyMedium?.copyWith(
        color: context.color.tertiary,
      ),
    ).tr();
  }
}
