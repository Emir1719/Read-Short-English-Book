import 'package:cached_network_image/cached_network_image.dart';
import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:flutter/material.dart';

class StoryItemImage extends StatelessWidget {
  const StoryItemImage({super.key, required this.story});
  final Story story;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Hero(
        tag: story.id,
        child: AspectRatio(
          aspectRatio: 3 / 4,
          child: CachedNetworkImage(
            imageUrl: story.thumbnail,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
