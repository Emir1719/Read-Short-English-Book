import 'package:english_will_fly/features/dictionary/data/models/phonetic.dart';
import 'package:english_will_fly/features/reading/util/color.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class BtnPlaySound extends StatelessWidget {
  const BtnPlaySound({super.key, this.phonetics});
  final List<Phonetic>? phonetics;

  @override
  Widget build(BuildContext context) {
    if (phonetics == null || phonetics!.isEmpty) {
      return const SizedBox();
    }

    final phonetic = phonetics?.firstWhere(
      (element) => element.audio != null && element.audio!.isNotEmpty,
    );

    if (phonetic == null) {
      return const SizedBox();
    }

    return IconButton(
      onPressed: () async {
        try {
          final player = AudioPlayer();

          await player.setUrl(phonetic.audio!);
          await player.setVolume(3.0);
          await player.play();
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error playing audio: ${e.toString()}')),
          );
        }
      },
      icon: Icon(
        Icons.mic_none_outlined,
        color: context.isDark ? AppColor.lightBlue : Colors.blue,
      ),
    );
  }
}
