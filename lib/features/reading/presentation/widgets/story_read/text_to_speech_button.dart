import 'package:english_will_fly/core/app_text_to_speech.dart';
import 'package:english_will_fly/core/dependency.dart';
import 'package:english_will_fly/features/reading/util/color.dart';
import 'package:flutter/material.dart';

class TextToSpeechButton extends StatelessWidget {
  const TextToSpeechButton({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    final tts = getIt<AppTextToSpeech>();

    return IconButton(
      onPressed: () async {
        await tts.speak(text);
      },
      icon: Icon(Icons.mic_none_outlined),
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColor.profileInfoBack),
        shape: WidgetStatePropertyAll(CircleBorder()),
        foregroundColor: WidgetStatePropertyAll(Colors.white),
      ),
    );
  }
}
