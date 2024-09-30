// ignore_for_file: must_be_immutable

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
  /// Home sayfasında listelenen hikayeler
  final List<Story> stories;

  /// Stories by levels sayfasında listelenen hikayeler
  final List<Story> filteredStories;

  /// Home sayfasındaki arama butonu için
  final bool isSearchActive;

  final List<Category> categories;

  int? selectedCategoryId;

  ReadingLoaded({
    required this.stories,
    required this.filteredStories,
    required this.categories,
    this.isSearchActive = false,
    this.selectedCategoryId,
  });

  @override
  List<Object> get props => [stories, filteredStories, isSearchActive, categories];
}

class ReadingError extends ReadingState {
  final String message;

  const ReadingError({required this.message});

  @override
  List<Object> get props => [message];
}
