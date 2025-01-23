import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_read/story_detail.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_read/story_read_paragraphs.dart';
import 'package:flutter/material.dart';

class StoryReadView extends StatelessWidget {
  const StoryReadView({super.key, required this.story});
  final Story story;

  @override
  Widget build(BuildContext context) {
    PageController? controller = PageController();

    return Scaffold(
      appBar: AppBar(title: Tooltip(message: story.title, child: Text(story.title))),
      body: SafeArea(
        child: Column(
          children: [
            // Chapter için
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: story.chapters.length,
                itemBuilder: (context, index) {
                  // paragraflar için
                  return StoryReadParagraphs(story: story, chapter: story.chapters[index]);
                },
              ),
            ),
            StoryDetail(story: story),
          ],
        ),
      ),
    );
  }
}
