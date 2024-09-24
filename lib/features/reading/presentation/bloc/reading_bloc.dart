import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:english_will_fly/features/reading/data/repositories/story_repository.dart';
import 'package:equatable/equatable.dart';

part 'reading_event.dart';
part 'reading_state.dart';

class ReadingBloc extends Bloc<ReadingEvent, ReadingState> {
  final _repository = StoryRepository();
  List<Story>? stories;
  List<Story>? _storiesCopy;

  ReadingBloc() : super(ReadingInitial()) {
    on<FetchStories>(fetchStories);
    on<LoadAllStories>(loadAllStories);
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
      _storiesCopy = List<Story>.from(stories ?? []);
      _storiesCopy!.shuffle(); // Sadece kopyayı karıştırıyoruz

      emit(ReadingLoaded(stories: _storiesCopy ?? []));
    } catch (e) {
      emit(ReadingError(message: e.toString()));
    }
  }
}
