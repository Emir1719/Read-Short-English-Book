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
      var story = await _api.loadStoryData(event.levelCode);
      emit(ReadingLoaded(story: story));
    } catch (e) {
      emit(ReadingError(message: e.toString()));
    }
  }
}
