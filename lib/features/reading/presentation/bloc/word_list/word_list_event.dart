part of 'word_list_bloc.dart';

sealed class WordListEvent extends Equatable {
  const WordListEvent();

  @override
  List<Object> get props => [];
}

class GetAllWords extends WordListEvent {}

class SaveWord extends WordListEvent {
  final String word;

  const SaveWord({required this.word});

  @override
  List<Object> get props => [word];
}

class RemoveWord extends WordListEvent {
  final String word;

  const RemoveWord({required this.word});

  @override
  List<Object> get props => [word];
}
