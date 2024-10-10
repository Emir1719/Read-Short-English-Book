import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:english_will_fly/features/reading/util/theme.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeData: AppTheme.light, isDarkMode: false)) {
    on<ThemeChanged>(_themeChanged);
  }

  FutureOr<void> _themeChanged(ThemeChanged event, Emitter<ThemeState> emit) {
    emit(
      ThemeState(
        themeData: event.isDarkMode ? AppTheme.dark : AppTheme.light,
        isDarkMode: event.isDarkMode,
      ),
    );
  }
}
