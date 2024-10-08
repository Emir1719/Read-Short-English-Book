part of 'word_list_bloc.dart';

sealed class WordListState extends Equatable {
  const WordListState();

  @override
  List<Object> get props => [];
}

final class WordListInitial extends WordListState {}

final class WordListLoading extends WordListState {}

final class WordListLoaded extends WordListState {
  final WordList? wordList;

  const WordListLoaded({required this.wordList});
}

final class WordListError extends WordListState {
  final String message;

  const WordListError({required this.message});
}
