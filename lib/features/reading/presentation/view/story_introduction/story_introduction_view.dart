import 'package:english_will_fly/features/reading/presentation/widgets/story_introduction/intro_detail.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_introduction/intro_picture.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_introduction/intro_reading.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:flutter/material.dart';

class StoryIntroductionView extends StatelessWidget {
  const StoryIntroductionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hikaye Detayı")),
      body: ListView(
        padding: AppPadding.defaults,
        children: [
          IntroPicture(),
          IntroDetail(),
          IntroReading(),
        ],
      ),
    );
  }
}
