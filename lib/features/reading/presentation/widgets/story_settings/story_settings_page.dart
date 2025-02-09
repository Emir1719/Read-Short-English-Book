import 'package:english_will_fly/features/reading/presentation/widgets/story_settings/story_select_font.dart';
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
        Text("Font Size", style: context.text.bodyMedium),
        /*Slider(
          value: selectedStyle.fontSize ?? 16,
          min: 10,
          max: 30,
          divisions: 20,
          activeColor: context.color.secondary,
          onChanged: (value) {
            // Font boyutu değiştiğinde, yeni stil oluşturulup Bloc'a gönderilir
            TextStyle newStyle = selectedStyle.copyWith(fontSize: value);
            bloc.add(ChangeStyle(newStyle));
          },
        ),
        Text(
          "Font Size: ${selectedStyle.fontSize?.toStringAsFixed(1)}",
          style: selectedStyle.copyWith(fontSize: 16),
        ),*/
      ],
    );
  }
}
