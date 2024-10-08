import 'package:cached_network_image/cached_network_image.dart';
import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:english_will_fly/features/reading/util/style.dart';
import 'package:flutter/material.dart';
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
            story.image.isNotEmpty ? _image(story) : const SizedBox(width: 140, height: 90),
            Expanded(
              child: Padding(
                padding: AppPadding.storyItem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _title(),
                    const SizedBox(height: 5),
                    _icon(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _icon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(story.category.title, style: AppStyle.storyCategoryTitle),
        Icon(
          Icons.check_circle_outline_outlined,
          size: 20,
          color: AppStyle.compliteColor(story.isCompleted),
        ),
      ],
    );
  }

  Text _title() {
    return Text(
      story.title,
      style: AppStyle.storyTitle,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  Widget _image(Story story) {
    var level = story.level.split("_")[0].toUpperCase();
    if (level.isEmpty) {
      level = "?";
    }

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
                decoration: AppStyle.storyLevel,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(level, style: const TextStyle(fontSize: 14)),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
