import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:flutter/material.dart';

class StoryReadButton extends StatelessWidget {
  const StoryReadButton({super.key, required this.story});

  final Story story;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.defaults,
      child: TextButton.icon(
        onPressed: () {
          print(story.id);
        },
        label: const Text("Okudum"),
        icon: const Icon(Icons.check_box),
      ),
    );
  }
}
