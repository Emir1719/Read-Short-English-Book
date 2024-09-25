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

  @override
  List<Object> get props => [levelCode];
}

class LoadAllStories extends ReadingEvent {}

class SaveStoryAsReaded extends ReadingEvent {
  final String storyId;

  const SaveStoryAsReaded({required this.storyId});

  @override
  List<Object> get props => [storyId];
}
