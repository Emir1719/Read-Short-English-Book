part of 'text_to_speech_bloc.dart';

abstract class TextToSpeechEvent extends Equatable {
  const TextToSpeechEvent();

  @override
  List<Object> get props => [];
}

class StartSpeaking extends TextToSpeechEvent {
  final String text;

  const StartSpeaking(this.text);
}

class PauseSpeaking extends TextToSpeechEvent {}

class ResumeSpeaking extends TextToSpeechEvent {}

class StopSpeaking extends TextToSpeechEvent {}

class UpdateProgress extends TextToSpeechEvent {
  final int currentWordIndex;

  const UpdateProgress({required this.currentWordIndex});
}
