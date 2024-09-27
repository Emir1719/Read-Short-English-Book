import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_image.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_read/story_detail.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_read_btn.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/text_parse.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:flutter/material.dart';

class StoryReadView extends StatelessWidget {
  const StoryReadView({super.key, required this.story});
  final Story story;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Tooltip(message: story.title, child: Text(story.title))),
      body: ListView(
        children: [
          StoryImage(story: story),
          StoryDetail(story: story),
          ...story.paragraphs.map((item) {
            return Padding(
              padding: AppPadding.defaults.copyWith(bottom: 5),
              child: RichText(text: TextParse.build(item, context, story)),
            );
          }),
          StoryReadButton(story: story),
        ],
      ),
    );
  }
}
