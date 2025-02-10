import 'package:english_will_fly/features/reading/presentation/widgets/story_settings/story_select_font.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_settings/story_select_font_size.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_settings/story_select_text_align.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_settings/story_select_text_height.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';

class StorySettingsPage extends StatelessWidget {
  const StorySettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 30,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15,
          children: [
            Text("Font Selection", style: context.text.bodyMedium),
            StorySelectFont(),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Font Size", style: context.text.bodyMedium),
            StorySelectFontSize(),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Text Height", style: context.text.bodyMedium),
            StorySelectTextHeight(),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Text Align", style: context.text.bodyMedium),
            StorySelectTextAlign(),
          ],
        ),
      ],
    );
  }
}
