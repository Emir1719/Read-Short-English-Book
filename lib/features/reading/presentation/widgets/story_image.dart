import 'package:english_will_fly/features/reading/data/models/story_element.dart';
import 'package:flutter/material.dart';

class StoryImage extends StatelessWidget {
  const StoryImage({super.key, required this.story});

  final Story story;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Image.network(
      story.image,
      height: size.height * 0.3,
      width: size.width,
      fit: BoxFit.cover,
    );
  }
}
