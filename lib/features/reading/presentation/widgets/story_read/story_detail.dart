import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/info_box.dart';
import 'package:flutter/material.dart';

class StoryDetail extends StatelessWidget {
  const StoryDetail({super.key, required this.story});
  final Story story;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade50,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InfoBox(title: "Level", value: story.level.toUpperCase(), icon: Icons.analytics),
          InfoBox(title: "New Words", value: story.definitions.length.toString(), icon: Icons.add_home_rounded),
        ],
      ),
    );
  }
}
