import 'package:english_will_fly/features/reading/presentation/bloc/story_settings/story_settings_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_settings/select_font_button.dart';
import 'package:english_will_fly/features/reading/util/init_state/error.dart';
import 'package:english_will_fly/features/reading/util/init_state/loading.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StorySelectTextHeight extends StatelessWidget {
  const StorySelectTextHeight({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<StorySettingsBloc>();

    return BlocBuilder<StorySettingsBloc, StorySettingsState>(
      builder: (context, state) {
        if (state is StorySettingsLoading) {
          return AppLoading();
        } else if (state is StorySettingsError) {
          return AppError(message: state.message);
        }

        final stateLoad = state as StorySettingsLoaded;
        final selectedStyle = stateLoad.style;

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                SelectFontButton(
                  icon: Icons.remove,
                  onPressed: () {
                    if (selectedStyle.height! > 1) {
                      // Decrease font size and send the updated style to the bloc
                      TextStyle newStyle =
                          selectedStyle.copyWith(height: selectedStyle.height! - 0.1);
                      bloc.add(ChangeStyle(newStyle));
                    }
                  },
                ),
                Text(
                  selectedStyle.height?.toStringAsFixed(1) ?? "1",
                  style: context.text.bodyLarge?.copyWith(fontWeight: FontWeight.normal),
                ),
                SelectFontButton(
                  icon: Icons.add,
                  onPressed: () {
                    if (selectedStyle.height! < 2.5) {
                      // Increase font size and send the updated style to the bloc
                      TextStyle newStyle =
                          selectedStyle.copyWith(height: selectedStyle.height! + 0.1);
                      bloc.add(ChangeStyle(newStyle));
                    }
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
