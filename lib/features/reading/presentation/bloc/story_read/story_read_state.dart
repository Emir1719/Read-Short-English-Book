part of 'story_read_bloc.dart';

sealed class StoryReadState extends Equatable {
  const StoryReadState();

  @override
  List<Object> get props => [];
}

final class StoryReadInitial extends StoryReadState {}

final class StoryReadLoading extends StoryReadState {}

final class StoryReadError extends StoryReadState {
  final String message;

  const StoryReadError({required this.message});

  @override
  List<Object> get props => [message];
}

final class StoryReadLoaded extends StoryReadState {
  final Story story;
  final int currentChapterId;

  const StoryReadLoaded({required this.story, required this.currentChapterId});

  @override
  List<Object> get props => [story, currentChapterId];
}
