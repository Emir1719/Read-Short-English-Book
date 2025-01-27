part of 'story_read_bloc.dart';

sealed class StoryReadEvent extends Equatable {
  const StoryReadEvent();

  @override
  List<Object> get props => [];
}

class LoadStory extends StoryReadEvent {
  final Story story;

  const LoadStory({required this.story});

  @override
  List<Object> get props => [story];
}

class ChangeChapter extends StoryReadEvent {
  final int chapterId;

  const ChangeChapter({required this.chapterId});

  @override
  List<Object> get props => [chapterId];
}
