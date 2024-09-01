import 'package:english_will_fly/features/reading/data/models/story_element.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/text_parse.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:flutter/material.dart';

class StoryReadView extends StatelessWidget {
  const StoryReadView({super.key, required this.story});
  final StoryElement story;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text(story.title)),
      body: ListView(
        children: [
          Image.network(
            story.image,
            height: size.height * 0.25,
            width: size.width,
            fit: BoxFit.cover,
          ),
          ...story.paragraphs.map((item) {
            return Padding(
              padding: AppPadding.defaults.copyWith(bottom: 5),
              child: RichText(text: TextParse().build(item, context, story)),
            );
          }),
        ],
      ),
    );
  }
}
