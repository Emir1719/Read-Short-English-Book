import 'package:cached_network_image/cached_network_image.dart';
import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:flutter/material.dart';

class StoryImage extends StatelessWidget {
  const StoryImage({super.key, required this.story});
  final Story story;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final percent = 0.25;

    return Hero(
      tag: story.id,
      child: CachedNetworkImage(
        imageUrl: story.image,
        placeholder: (context, url) => SizedBox.shrink(),
        errorWidget: (context, url, error) => Icon(Icons.error, color: Colors.red),
        height: size.height * percent,
        width: size.width,
        fit: BoxFit.cover,
      ),
    );
  }
}
