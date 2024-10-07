import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_will_fly/features/auth/data/repositories/firestore.dart';
import 'package:english_will_fly/features/reading/data/models/category.dart';
import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:english_will_fly/features/reading/data/models/story_readed.dart';
import 'package:english_will_fly/features/reading/data/repositories/story_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'reading_event.dart';
part 'reading_state.dart';

class ReadingBloc extends Bloc<ReadingEvent, ReadingState> {
  final _repository = StoryRepository();
  final _firestore = FirestoreRepository(FirebaseFirestore.instance, FirebaseAuth.instance);
  List<Story>? stories;
  List<Story>? filteredStories;
  List<Category>? categories;

  ReadingBloc() : super(ReadingInitial()) {
    on<FetchStories>(fetchStories);
    on<LoadAllStories>(loadAllStories);
    on<SaveStoryAsReaded>(saveStoryAsReaded);
    on<SearchStories>(searchStories);
    on<ToggleSearchBar>(toggleSearchBar);
    on<FilterStoriesByCategory>(onFilterStoriesByCategory);
  }

  /// Seviyeye göre ingilizce hikayeleri getirir
  Future<void> fetchStories(FetchStories event, emit) async {
    try {
      emit(ReadingLoading());
      if (stories == null) {
        emit(const ReadingError(message: "Story listesi boş"));
        return;
      }

      filteredStories = stories
          ?.where((story) => story.level.toLowerCase() == event.levelCode.toLowerCase())
          .toList();
      /*filteredStories?.sort((a, b) {
        print(a.id.split("_"));
        return a.id.split("_")[1].compareTo(b.id.split("_")[1]);
      });*/
      emit(
        ReadingLoaded(
          stories: stories ?? [],
          filteredStories: filteredStories ?? [],
          categories: categories ?? [],
        ),
      );
    } catch (e) {
      emit(ReadingError(message: e.toString()));
    }
  }

  Future<void> loadAllStories(LoadAllStories event, Emitter<ReadingState> emit) async {
    try {
      emit(ReadingLoading());
      stories = await _repository.getStoriesWithCategoriesForAllLevels();
      var reading = await _firestore.getAllReading();
      categories = await _repository.getCategories();

      _complete(reading);

      stories?.shuffle();

      // Tamamlanmayan hikayeleri öne çıkarır
      stories?.sort((a, b) => a.isCompleted == b.isCompleted ? 0 : (a.isCompleted ? 1 : -1));

      emit(
        ReadingLoaded(
          stories: stories ?? [],
          filteredStories: [],
          categories: categories ?? [],
        ),
      );
    } catch (e) {
      emit(ReadingError(message: e.toString()));
    }
  }

  void _complete(StoryReaded reading) {
    stories = stories?.map((story) {
      if (reading.storyIds.contains(story.id)) {
        return story.copyWith(isCompleted: true);
      }
      return story;
    }).toList();
  }

  Future<void> saveStoryAsReaded(SaveStoryAsReaded event, Emitter<ReadingState> emit) async {
    try {
      emit(ReadingLoading());
      await _firestore.saveReading(event.storyId);

      // Find and update the story with matching id
      stories = stories?.map((story) {
        if (story.id.toString() == event.storyId) {
          return story.copyWith(isCompleted: true);
        }
        return story;
      }).toList();

      filteredStories = stories?.where((story) => story.level == event.levelCode).toList();

      emit(
        ReadingLoaded(
          stories: stories ?? [],
          filteredStories: filteredStories ?? [],
          categories: categories ?? [],
        ),
      ); // Emit updated stories list
    } catch (e) {
      emit(ReadingError(message: e.toString()));
    }
  }

  Future<void> searchStories(SearchStories event, Emitter<ReadingState> emit) async {
    final filtered = stories
        ?.where((story) => story.title.toLowerCase().contains(event.query.toLowerCase()))
        .toList();

    emit(
      ReadingLoaded(
        stories: filtered ?? [],
        filteredStories: filteredStories ?? [],
        isSearchActive: true,
        categories: categories ?? [],
      ),
    );
  }

  Future<void> toggleSearchBar(ToggleSearchBar event, Emitter<ReadingState> emit) async {
    if (state is ReadingLoaded) {
      final currentState = state as ReadingLoaded;
      var isSearchActive = !currentState.isSearchActive;

      emit(
        ReadingLoaded(
          stories: isSearchActive ? currentState.stories : stories ?? [],
          filteredStories: currentState.filteredStories,
          isSearchActive: isSearchActive,
          categories: categories ?? [],
        ),
      ); // Arama barını aç/kapa
    }
  }

  FutureOr<void> onFilterStoriesByCategory(
      FilterStoriesByCategory event, Emitter<ReadingState> emit) {
    final filtered = stories?.where((story) => story.category.id == event.categoryId).toList();
    bool isDifferentCategory = (state as ReadingLoaded).selectedCategoryId != event.categoryId;

    emit(
      ReadingLoaded(
        stories: isDifferentCategory ? (filtered ?? []) : (stories ?? []),
        filteredStories: filteredStories ?? [],
        categories: categories ?? [],
        selectedCategoryId: isDifferentCategory ? event.categoryId : null,
      ),
    );
  }
}
