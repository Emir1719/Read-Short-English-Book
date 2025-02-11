import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_will_fly/features/auth/data/repository_impl/firestore_reading.dart';
import 'package:english_will_fly/features/reading/data/models/category.dart';
import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:english_will_fly/features/reading/data/models/story_readed.dart';
import 'package:english_will_fly/features/reading/data/repositories/story_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'reading_event.dart';
part 'reading_state.dart';

class ReadingBloc extends Bloc<ReadingEvent, ReadingState> {
  final _repository = StoryRepository();
  final _firestoreReading = FirestoreReading(FirebaseFirestore.instance, FirebaseAuth.instance);
  List<Story>? stories;
  List<Story>? filteredStories;
  List<Category>? categories;
  final _analytics = FirebaseAnalytics.instance;

  ReadingBloc() : super(ReadingInitial()) {
    on<FetchStories>(fetchStories);
    on<LoadAllStories>(loadAllStories);
    on<StoryToggleLiked>(toggleLiked);
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
      stories = await _repository.getStoriesWithCategories();
      var reading = await _firestoreReading.getAllReading();
      categories = await _repository.getCategories();

      _complete(reading);

      stories?.shuffle();

      // Tamamlanmayan hikayeleri öne çıkarır
      stories?.sort((a, b) => a.isLiked == b.isLiked ? 0 : (a.isLiked ? 1 : -1));

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

  void _complete(StoryReaded? reading) {
    if (reading == null) {
      return;
    }

    stories = stories?.map((story) {
      if (reading.storyIds.contains(story.id)) {
        return story.copyWith(isLiked: true);
      }
      return story;
    }).toList();
  }

  Story getStoryById(String id) {
    return stories!.firstWhere((element) => element.id == id);
  }

  Future<void> toggleLiked(StoryToggleLiked event, Emitter<ReadingState> emit) async {
    try {
      emit(ReadingLoading());
      bool isLiked = false;

      // Find and update the story with matching id
      stories = stories?.map((story) {
        if (story.id.toString() == event.storyId) {
          isLiked = !story.isLiked;
          return story.copyWith(isLiked: !story.isLiked);
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

      if (isLiked) {
        await _firestoreReading.saveLiked(event.storyId);
        await _analytics.logEvent(name: "story_liked");
      } else {
        await _firestoreReading.unsaveLiked(event.storyId);
        await _analytics.logEvent(name: "story_unliked");
      }
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
    FilterStoriesByCategory event,
    Emitter<ReadingState> emit,
  ) async {
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

    await _analytics.logEvent(name: "category_selected_${event.categoryId}");
  }
}
