part of 'text_to_speech_bloc.dart';

abstract class TextToSpeechState extends Equatable {
  const TextToSpeechState();

  @override
  List<Object> get props => [];
}

class TextToSpeechInitial extends TextToSpeechState {}

class TextToSpeechRunning extends TextToSpeechState {
  final List<String> words;
  final int currentWordIndex;

  const TextToSpeechRunning({required this.words, required this.currentWordIndex});

  @override
  List<Object> get props => [words, currentWordIndex];
}

class TextToSpeechPaused extends TextToSpeechState {
  final List<String> words;
  final int currentWordIndex;

  const TextToSpeechPaused({required this.words, required this.currentWordIndex});

  @override
  List<Object> get props => [words, currentWordIndex];
}

class TextToSpeechError extends TextToSpeechState {
  final String message;

  const TextToSpeechError(this.message);

  @override
  List<Object> get props => [message];
}
