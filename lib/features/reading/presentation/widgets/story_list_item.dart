import 'package:cached_network_image/cached_network_image.dart';
import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:english_will_fly/features/reading/util/color.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:english_will_fly/features/reading/util/style.dart';
import 'package:english_will_fly/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class StoryListItem extends StatelessWidget {
  const StoryListItem({super.key, required this.story, this.showLevel = false});
  final Story story;
  final bool showLevel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push("/read", extra: story),
      child: Container(
        decoration: AppStyle.level,
        child: Row(
          children: [
            story.image.isNotEmpty
                ? _image(story, context)
                : const SizedBox(width: 140, height: 90),
            Expanded(
              child: Padding(
                padding: AppPadding.storyItem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _title(context),
                    const SizedBox(height: 5),
                    _iconAndCategory(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _iconAndCategory(BuildContext context) {
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
        ),
        Icon(
          Icons.check_circle_outline_outlined,
          size: 20,
          color: AppStyle.compliteColor(isDark, story.isCompleted),
        ),
      ],
    );
  }

  Text _title(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Text(
      story.title,
      style: textTheme.titleLarge,
      maxLines: 1,
    );
  }

  Widget _image(Story story, BuildContext context) {
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
