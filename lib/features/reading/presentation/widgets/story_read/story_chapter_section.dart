import 'package:english_will_fly/features/reading/data/models/chapter.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/story_settings/story_settings_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_image.dart';
import 'package:english_will_fly/features/reading/util/init_state/error.dart';
import 'package:english_will_fly/features/reading/util/init_state/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoryChapterSection extends StatelessWidget {
  const StoryChapterSection({super.key, required this.chapter});
  final Chapter chapter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StorySettingsBloc, StorySettingsState>(
      builder: (context, state) {
        if (state is StorySettingsLoading) {
          return AppLoading();
        } else if (state is StorySettingsError) {
          return AppError(message: state.message);
        }
        state = state as StorySettingsLoaded;
        final style = state.style;

        return Column(
          spacing: 5,
          children: [
            chapter.id == 1 ? StoryImage() : SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                "Chapter - ${chapter.id}",
                style: style.copyWith(
                  fontSize: style.fontSize! + 1,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              chapter.title,
              style: style.copyWith(height: 1),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
