part of 'dictionary_bloc.dart';

sealed class DictionaryEvent extends Equatable {
  const DictionaryEvent();

  @override
  List<Object> get props => [];
}

class FetchDictionary extends DictionaryEvent {}

class FetchWordFromDictionary extends DictionaryEvent {
  /// Aranılan kelime
  final String word;

  const FetchWordFromDictionary({required this.word});
}
