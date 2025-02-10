import 'package:english_will_fly/features/reading/presentation/bloc/story_settings/story_settings_bloc.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:english_will_fly/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Switch(
          value: state.isDarkMode,
          onChanged: (value) {
            context.read<ThemeBloc>().add(ThemeChanged(isDarkMode: value));
            context.read<StorySettingsBloc>().add(RefreshSettings(
                  context.color.primary == Colors.white ? Colors.white : Colors.black,
                ));
          },
        );
      },
    );
  }
}
