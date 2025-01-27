import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'story_read_event.dart';
part 'story_read_state.dart';

class StoryReadBloc extends Bloc<StoryReadEvent, StoryReadState> {
  final PageController? controller = PageController();

  StoryReadBloc() : super(StoryReadInitial()) {
    on<LoadStory>(_loadStory);
  }

  FutureOr<void> _loadStory(LoadStory event, Emitter<StoryReadState> emit) {
    emit(StoryReadLoading());

    try {
      emit(StoryReadLoaded(story: event.story));
    } catch (e) {
      emit(StoryReadError(message: e.toString()));
    }
  }
}
