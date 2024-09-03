part of 'dictionary_bloc.dart';

sealed class DictionaryState extends Equatable {
  const DictionaryState();

  @override
  List<Object> get props => [];
}

final class DictionaryInitial extends DictionaryState {}

final class DictionaryLoading extends DictionaryState {}

final class DictionaryLoaded extends DictionaryState {
  final List<Dictionary> dictionary;

  const DictionaryLoaded({required this.dictionary});

  @override
  List<Object> get props => [dictionary];
}

final class DictionaryWordLoaded extends DictionaryState {
  /// Aranılan kelimenin anlamı
  final String mean;

  const DictionaryWordLoaded({required this.mean});

  @override
  List<Object> get props => [mean];
}

final class DictionaryError extends DictionaryState {
  final String message;

  const DictionaryError({required this.message});

  @override
  List<Object> get props => [message];
}
