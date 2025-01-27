import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:equatable/equatable.dart';

part 'story_read_event.dart';
part 'story_read_state.dart';

class StoryReadBloc extends Bloc<StoryReadEvent, StoryReadState> {
  StoryReadBloc() : super(StoryReadInitial()) {
    on<LoadStory>(_loadStory);
    on<ChangeChapter>(_changeChapter);
  }

  FutureOr<void> _loadStory(LoadStory event, Emitter<StoryReadState> emit) {
    emit(StoryReadLoading());

    try {
      emit(StoryReadLoaded(story: event.story, currentChapterId: 1));
    } catch (e) {
      emit(StoryReadError(message: e.toString()));
    }
  }

  FutureOr<void> _changeChapter(ChangeChapter event, Emitter<StoryReadState> emit) {
    try {
      emit(StoryReadLoaded(
        story: (state as StoryReadLoaded).story,
        currentChapterId: event.chapterId,
      ));
    } catch (e) {
      emit(StoryReadError(message: e.toString()));
    }
  }
}
