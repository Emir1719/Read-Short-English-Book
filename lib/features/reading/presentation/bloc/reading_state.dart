part of 'reading_bloc.dart';

abstract class ReadingState extends Equatable {
  const ReadingState();

  @override
  List<Object> get props => [];
}

class ReadingInitial extends ReadingState {}

class ReadingLoading extends ReadingState {}

class ReadingLoaded extends ReadingState {
  final List<Story> story;

  const ReadingLoaded({required this.story});

  @override
  List<Object> get props => [story];
}

class ReadingError extends ReadingState {
  final String message;

  const ReadingError({required this.message});

  @override
  List<Object> get props => [message];
}
