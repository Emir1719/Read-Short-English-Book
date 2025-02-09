import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/story_read/story_read_bloc.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IntroDetail extends StatelessWidget {
  const IntroDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final blocState = context.watch<StoryReadBloc>().state as StoryReadLoaded;
    final story = blocState.story;
    const space = SizedBox(height: 20);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            story.title,
            style: context.text.bodyLarge,
          ),
          space,
          Text(
            story.introduction,
            style: context.text.bodyMedium,
            maxLines: 10,
            overflow: TextOverflow.ellipsis,
          ),
          space,
          Text(
            story.level.toUpperCase(),
            style: context.text.bodyMedium,
          ),
          space,
          Row(
            spacing: 10,
            children: [
              ImageIcon(
                AssetImage("assets/image/category_icon/${story.category.iconName}"),
                size: 20,
                color: context.color.onSurface,
              ),
              Text(
                story.category.title.tr(),
              ),
            ],
          ),
          space,
          Text(
            "${story.chapters.length} chapters",
            style: context.text.bodyMedium,
          ),
        ],
      ),
    );
  }
}
