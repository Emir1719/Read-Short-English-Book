part of 'dictionary_bloc.dart';

abstract class DictionaryEvent extends Equatable {
  const DictionaryEvent();

  @override
  List<Object> get props => [];
}

/// İstenilen kelimenin anlamını getirmek için
class GetMean extends DictionaryEvent {
  final String word;

  const GetMean({required this.word});
}
