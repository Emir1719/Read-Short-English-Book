import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:english_will_fly/features/reading/presentation/view/story_read/story_read_view.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:english_will_fly/features/reading/util/style.dart';
import 'package:flutter/material.dart';

class StoryListItem extends StatelessWidget {
  const StoryListItem({super.key, required this.story});
  final Story story;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(story.category.title);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => StoryReadView(story: story)));
      },
      child: Container(
        decoration: AppStyle.level,
        child: Row(
          children: [
            story.image.isNotEmpty ? image(story) : const SizedBox(),
            title(story),
          ],
        ),
      ),
    );
  }

  Padding title(Story story) {
    return Padding(
      padding: AppPadding.defaults,
      child: Text(story.title, style: AppStyle.storyTitle),
    );
  }

  ClipRRect image(Story story) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.network(
        story.image,
        width: 130,
        height: 90,
        fit: BoxFit.cover,
      ),
    );
  }
}
