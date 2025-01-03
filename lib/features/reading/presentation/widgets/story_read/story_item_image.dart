import 'package:cached_network_image/cached_network_image.dart';
import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:english_will_fly/features/reading/util/style.dart';
import 'package:english_will_fly/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoryItemImage extends StatelessWidget {
  const StoryItemImage({super.key, required this.story, required this.showLevel});
  final Story story;
  final bool showLevel;

  @override
  Widget build(BuildContext context) {
    var level = story.level.split("_")[0].toUpperCase();
    if (level.isEmpty) {
      level = "?";
    }
    bool isDark = context.read<ThemeBloc>().state.isDarkMode;

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Hero(
            tag: story.id,
            child: CachedNetworkImage(
              imageUrl: story.image,
              width: 140,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
        ),
        showLevel
            ? Container(
                decoration: AppStyle.storyLevel(isDark),
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(level, style: const TextStyle(fontSize: 14)),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
