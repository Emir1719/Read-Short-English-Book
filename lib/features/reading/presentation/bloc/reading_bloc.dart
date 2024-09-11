import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:english_will_fly/features/reading/data/repositories/story_repository.dart';
import 'package:equatable/equatable.dart';

part 'reading_event.dart';
part 'reading_state.dart';

class ReadingBloc extends Bloc<ReadingEvent, ReadingState> {
  final _repository = StoryRepository();

  ReadingBloc() : super(ReadingInitial()) {
    on<FetchStories>(fetchStories);
  }

  /// Seviyeye göre ingilizce hikayeleri getirir
  Future<void> fetchStories(FetchStories event, emit) async {
    try {
      emit(ReadingLoading());
      var storiesWithCategories = await _repository.getStoriesWithCategories(event.levelCode);
      emit(ReadingLoaded(story: storiesWithCategories));
    } catch (e) {
      emit(ReadingError(message: e.toString()));
    }
  }
}
