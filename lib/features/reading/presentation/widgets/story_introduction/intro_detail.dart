import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/core/extensions/string_extensions.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/story_read/story_read_bloc.dart';
import 'package:english_will_fly/features/reading/util/image.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IntroDetail extends StatelessWidget {
  const IntroDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final blocState = context.watch<StoryReadBloc>().state as StoryReadLoaded;
    final story = blocState.story;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            story.title,
            style: context.text.bodyLarge,
          ),
          Text(
            story.introduction,
            style: context.text.bodyMedium,
            maxLines: 10,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            story.level.toUpperCase(),
            style: context.text.bodyMedium,
          ),
          Row(
            spacing: 10,
            children: [
              AppImage.getCategoryPath(story.category.iconName).toIcon(context, size: 22),
              Text(story.category.title.tr()),
            ],
          ),
          Text(
            "${story.chapters.length} chapters",
            style: context.text.bodyMedium,
          ),
        ],
      ),
    );
  }
}
