import 'package:english_will_fly/features/reading/presentation/bloc/story_settings/story_settings_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_read/story_read_snackbar.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/word_mean/text_parse.dart';
import 'package:english_will_fly/features/reading/util/init_state/error.dart';
import 'package:english_will_fly/features/reading/util/init_state/loading.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoryTextParse extends StatelessWidget {
  const StoryTextParse({super.key, required this.text});
  final String text;

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

        return GestureDetector(
          onLongPress: () async {
            await StoryReadSnackBar.showTranslatedText(context: context, text: text);
          },
          child: Padding(
            padding: AppPadding.storyRead,
            child: RichText(
              text: TextParse(state.style).build(text, context),
              textAlign: state.textAlign,
            ),
          ),
        );
      },
    );
  }
}
