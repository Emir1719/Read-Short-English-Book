import 'package:english_will_fly/features/reading/data/models/chapter.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_read/story_chapter_section.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_read/story_text_parse.dart';
import 'package:flutter/material.dart';

class StoryReadParagraphs extends StatelessWidget {
  const StoryReadParagraphs({super.key, required this.chapter});
  final Chapter chapter;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chapter.paragraphs.length + 1,
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: 20),
      itemBuilder: (context, index) {
        if (index == 0) {
          return StoryChapterSection(chapter: chapter);
        }
        return StoryTextParse(text: chapter.paragraphs[index - 1]);
      },
    );
  }
}
