import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english_will_fly/features/auth/data/repositories/firestore.dart';
import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:english_will_fly/features/reading/data/repositories/story_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'reading_event.dart';
part 'reading_state.dart';

class ReadingBloc extends Bloc<ReadingEvent, ReadingState> {
  final _repository = StoryRepository();
  final _firestore = FirestoreRepository(FirebaseFirestore.instance, FirebaseAuth.instance);
  List<Story>? stories;
  List<Story>? storiesCopy;

  ReadingBloc() : super(ReadingInitial()) {
    on<FetchStories>(fetchStories);
    on<LoadAllStories>(loadAllStories);
    on<SaveStoryAsReaded>(saveStoryAsReaded);
  }

  /// Seviyeye göre ingilizce hikayeleri getirir
  Future<void> fetchStories(FetchStories event, emit) async {
    try {
      emit(ReadingLoading());
      if (stories == null) {
        emit(const ReadingError(message: "Story listesi boş"));
        return;
      }

      var storyFiltered =
          stories!.where((story) => story.level.toLowerCase() == event.levelCode.toLowerCase()).toList();
      emit(ReadingLoaded(stories: storyFiltered));
    } catch (e) {
      emit(ReadingError(message: e.toString()));
    }
  }

  Future<void> loadAllStories(LoadAllStories event, Emitter<ReadingState> emit) async {
    try {
      emit(ReadingLoading());
      stories = await _repository.getStoriesWithCategoriesForAllLevels();

      // Orijinal listeyi değiştirmemek için kopyasını oluşturuyoruz
      /*var storiesCopy = List<Story>.from(stories ?? []);
      storiesCopy.shuffle(); // Sadece kopyayı karıştırıyoruz*/

      emit(ReadingLoaded(stories: stories!));
    } catch (e) {
      emit(ReadingError(message: e.toString()));
    }
  }

  Future<void> saveStoryAsReaded(SaveStoryAsReaded event, Emitter<ReadingState> emit) async {
    try {
      emit(ReadingLoading());
      await _firestore.saveReading(event.storyId);
      // Find and update the story with matching id
      stories = stories?.map((story) {
        if (story.id.toString() == event.storyId) {
          // Set isComplete to true for the matching story
          return story.copyWith(isCompleted: true);
        }
        return story;
      }).toList();

      emit(ReadingLoaded(stories: stories!)); // Emit updated stories list
    } catch (e) {
      emit(ReadingError(message: e.toString()));
    }
  }
}
