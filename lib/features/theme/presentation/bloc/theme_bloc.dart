import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:english_will_fly/features/reading/util/theme.dart';
import 'package:english_will_fly/features/theme/data/theme_storage.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(
          ThemeState(
            themeData: ThemeStorage().getThemeMode() ? AppTheme.dark : AppTheme.light,
            isDarkMode: ThemeStorage().getThemeMode(),
          ),
        ) {
    on<ThemeChanged>(_themeChanged);
  }

  FutureOr<void> _themeChanged(ThemeChanged event, Emitter<ThemeState> emit) async {
    final storage = ThemeStorage();
    await storage.setThemeMode(event.isDarkMode);

    emit(
      ThemeState(
        themeData: event.isDarkMode ? AppTheme.dark : AppTheme.light,
        isDarkMode: event.isDarkMode,
      ),
    );
  }
}
