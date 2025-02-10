import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:english_will_fly/features/theme/data/theme_storage.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(
          ThemeState(isDarkMode: ThemeStorage().getThemeMode()),
        ) {
    on<ThemeChanged>(_themeChanged);
  }

  FutureOr<void> _themeChanged(ThemeChanged event, Emitter<ThemeState> emit) async {
    final storage = ThemeStorage();
    await storage.setThemeMode(event.isDarkMode);
    final analytics = FirebaseAnalytics.instance;

    emit(ThemeState(isDarkMode: event.isDarkMode));

    await analytics.logEvent(name: "theme_selected_${event.isDarkMode ? "dark" : "light"}");
  }
}
