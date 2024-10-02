part of 'dictionary_bloc.dart';

abstract class DictionaryState extends Equatable {
  const DictionaryState();

  @override
  List<Object> get props => [];
}

class DictionaryInitial extends DictionaryState {}

class DictionaryLoading extends DictionaryState {}

class DictionaryError extends DictionaryState {
  final String message;

  const DictionaryError({required this.message});
}

class DictionaryLoaded extends DictionaryState {
  final List<Dictionary> dictionaryList;

  const DictionaryLoaded({required this.dictionaryList});
}
