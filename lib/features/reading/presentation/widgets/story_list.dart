import 'package:english_will_fly/features/reading/data/models/story_element.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/view/story_read/story_read_view.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:english_will_fly/features/reading/util/style.dart';
import 'package:flutter/material.dart';

class StoryList extends StatelessWidget {
  const StoryList({super.key, required this.state});
  final ReadingLoaded state;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      padding: AppPadding.defaults,
      itemCount: state.story.stories.length,
      itemBuilder: (context, index) {
        var story = state.story.stories[index];

        return GestureDetector(
          onTap: () {
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
      },
    );
  }

  Padding title(StoryElement story) {
    return Padding(
      padding: AppPadding.defaults,
      child: Text(story.title, style: AppStyle.storyTitle),
    );
  }

  ClipRRect image(StoryElement story) {
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
