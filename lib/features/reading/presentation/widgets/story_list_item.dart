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
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => StoryReadView(story: story)));
      },
      child: Container(
        decoration: AppStyle.level,
        child: Row(
          children: [
            story.image.isNotEmpty ? _image(story) : const SizedBox(),
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
      maxLines: 2,
    );
  }

  ClipRRect _image(Story story) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.network(
        story.image,
        width: 140,
        height: 90,
        fit: BoxFit.cover,
      ),
    );
  }
}
