import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/setting/language_dropdown.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:english_will_fly/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('settings.title').tr()),
      body: ListView(
        padding: AppPadding.defaults,
        children: [
          LanguageDropdown(),
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return Switch(
                value: state.isDarkMode,
                onChanged: (value) {
                  print("value: $value");
                  context.read<ThemeBloc>().add(ThemeChanged(isDarkMode: value));
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
