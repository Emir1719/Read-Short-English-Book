import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:english_will_fly/core/speech_controller.dart';
import 'package:equatable/equatable.dart';

part 'text_to_speech_event.dart';
part 'text_to_speech_state.dart';

class TextToSpeechBloc extends Bloc<TextToSpeechEvent, TextToSpeechState> {
  final TextToSpeechController _controller;

  TextToSpeechBloc(this._controller) : super(TextToSpeechInitial()) {
    on<StartSpeaking>(startSpeaking);
    on<PauseSpeaking>(pauseSpeaking);
    on<ResumeSpeaking>(resumeSpeaking);
    on<StopSpeaking>(stopSpeaking);
    on<UpdateProgress>(updateProgress);

    // Progress güncellemelerini dinle
    _controller.progressStream.listen((currentWordIndex) {
      add(UpdateProgress(currentWordIndex: currentWordIndex));
    });
  }

  FutureOr<void> startSpeaking(StartSpeaking event, emit) async {
    try {
      await _controller.speak(event.text);
      emit(TextToSpeechRunning(
        words: _controller.words,
        currentWordIndex: _controller.currentWordIndex,
      ));
    } catch (e) {
      emit(TextToSpeechError(e.toString()));
    }
  }

  FutureOr<void> pauseSpeaking(PauseSpeaking event, emit) async {
    try {
      await _controller.pause();
      emit(TextToSpeechPaused(
        words: _controller.words,
        currentWordIndex: _controller.currentWordIndex,
      ));
    } catch (e) {
      emit(TextToSpeechError(e.toString()));
    }
  }

  FutureOr<void> resumeSpeaking(ResumeSpeaking event, emit) async {
    try {
      await _controller.resume();
      emit(TextToSpeechRunning(
        words: _controller.words,
        currentWordIndex: _controller.currentWordIndex,
      ));
    } catch (e) {
      emit(TextToSpeechError(e.toString()));
    }
  }

  FutureOr<void> stopSpeaking(StopSpeaking event, emit) async {
    try {
      await _controller.stop();
      emit(TextToSpeechInitial());
    } catch (e) {
      emit(TextToSpeechError(e.toString()));
    }
  }

  FutureOr<void> updateProgress(UpdateProgress event, emit) {
    if (state is TextToSpeechRunning) {
      emit(TextToSpeechRunning(
        words: (state as TextToSpeechRunning).words,
        currentWordIndex: event.currentWordIndex,
      ));
    }
  }
}
