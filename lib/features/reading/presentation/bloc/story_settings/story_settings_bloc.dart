import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

part 'story_settings_event.dart';
part 'story_settings_state.dart';

class StorySettingsBloc extends Bloc<StorySettingsEvent, StorySettingsState> {
  final BuildContext context;

  StorySettingsBloc(this.context)
      : super(StorySettingsLoaded(
          style: GoogleFonts.urbanist(height: 1.7, fontSize: 18, color: context.color.onSurface),
        )) {
    on<ChangeStyle>(_changeStyle);
  }

  FutureOr<void> _changeStyle(ChangeStyle event, Emitter<StorySettingsState> emit) async {
    try {
      emit(StorySettingsLoading());
      emit(StorySettingsLoaded(style: event.style));
    } catch (e) {
      emit(StorySettingsError(e.toString()));
    }
  }
}
