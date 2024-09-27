part of 'reading_bloc.dart';

abstract class ReadingState extends Equatable {
  const ReadingState();

  @override
  List<Object> get props => [];
}

class ReadingInitial extends ReadingState {}

class ReadingLoading extends ReadingState {}

class ReadingSaveSuccess extends ReadingState {}

class ReadingLoaded extends ReadingState {
  final List<Story> stories;
  final List<Story> filteredStories;
  final bool isSearchActive;

  const ReadingLoaded({
    required this.stories,
    required this.filteredStories,
    this.isSearchActive = false,
  });

  @override
  List<Object> get props => [stories, filteredStories, isSearchActive];
}

class ReadingError extends ReadingState {
  final String message;

  const ReadingError({required this.message});

  @override
  List<Object> get props => [message];
}
