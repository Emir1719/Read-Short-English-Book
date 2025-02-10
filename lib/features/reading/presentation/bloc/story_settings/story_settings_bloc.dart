import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_settings/settings_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'story_settings_event.dart';
part 'story_settings_state.dart';

class StorySettingsBloc extends Bloc<StorySettingsEvent, StorySettingsState> {
  final SettingsRepository settingsRepository;
  final BuildContext context;

  StorySettingsBloc(this.settingsRepository, this.context)
      : super(
          StorySettingsLoaded(
            style: settingsRepository.getTextStyle(context),
            textAlign: settingsRepository.getTextAlign(),
          ),
        ) {
    on<ChangeStyle>(_changeStyle);
    on<ChangeAlign>(_changeAlign);
  }

  FutureOr<void> _changeStyle(ChangeStyle event, Emitter<StorySettingsState> emit) async {
    try {
      // Mevcut state'i alın ve StorySettingsLoaded ise işleme devam edin.
      final currentState = state;
      if (currentState is StorySettingsLoaded) {
        emit(StorySettingsLoading());
        // style'ı güncellerken textAlign değişmeden kalsın.
        emit(currentState.copyWith(style: event.style));
        await settingsRepository.saveTextStyle(event.style);
      }
    } catch (e) {
      emit(StorySettingsError(e.toString()));
    }
  }

  FutureOr<void> _changeAlign(ChangeAlign event, Emitter<StorySettingsState> emit) async {
    try {
      // Mevcut state'i alın ve StorySettingsLoaded ise işleme devam edin.
      final currentState = state;
      if (currentState is StorySettingsLoaded) {
        emit(StorySettingsLoading());
        // textAlign'i güncellerken style aynı kalsın.
        emit(currentState.copyWith(textAlign: event.textAlign));
        await settingsRepository.setTextAlign(event.textAlign);
      }
    } catch (e) {
      emit(StorySettingsError(e.toString()));
    }
  }
}
