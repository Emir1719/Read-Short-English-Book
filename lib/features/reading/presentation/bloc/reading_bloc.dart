import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:english_will_fly/features/reading/data/datasources/story_api.dart';
import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:equatable/equatable.dart';

part 'reading_event.dart';
part 'reading_state.dart';

class ReadingBloc extends Bloc<ReadingEvent, ReadingState> {
  final _api = StoryApi();

  ReadingBloc() : super(ReadingInitial()) {
    on<FetchStories>(fetchStories);
  }

  /// Seviyeye göre ingilizce hikayeleri getirir
  Future<void> fetchStories(FetchStories event, emit) async {
    try {
      emit(ReadingLoading());
      // Hikayeleri ve kategorileri ayrı ayrı yükle
      var stories = await _api.loadStoryData(event.levelCode);
      var categories = await _api.loadCategories();

      // Hikayeleri kategorilerle eşleştir
      var storiesWithCategories = stories.map((story) {
        var category = categories.firstWhere((cat) => cat.id == story.category.id);
        return Story(
          id: story.id,
          title: story.title,
          category: category, // Eşleştirilmiş kategori
          image: story.image,
          paragraphs: story.paragraphs,
          definitions: story.definitions,
        );
      }).toList();

      emit(ReadingLoaded(story: storiesWithCategories));
    } catch (e) {
      emit(ReadingError(message: e.toString()));
    }
  }
}
