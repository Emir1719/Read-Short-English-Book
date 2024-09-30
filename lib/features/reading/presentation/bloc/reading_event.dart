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
  final String levelCode;

  const SaveStoryAsReaded({required this.storyId, required this.levelCode});

  @override
  List<Object> get props => [storyId];
}

class SearchStories extends ReadingEvent {
  final String query;

  const SearchStories(this.query);
}

class ToggleSearchBar extends ReadingEvent {} // Arama barını aç/kapa

class FilterStoriesByCategory extends ReadingEvent {
  final int categoryId;

  const FilterStoriesByCategory(this.categoryId);

  @override
  List<Object> get props => [categoryId];
}
