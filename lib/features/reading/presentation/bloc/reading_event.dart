part of 'reading_bloc.dart';

abstract class ReadingEvent extends Equatable {
  const ReadingEvent();

  @override
  List<Object> get props => [];
}

class FetchStories extends ReadingEvent {
  /// İngilizce seviyesini temsil ediyor. Ör: a1
  final String levelCode;

  const FetchStories({required this.levelCode});
}

class LoadAllStories extends ReadingEvent {}
