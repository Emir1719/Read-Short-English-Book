part of 'story_settings_bloc.dart';

sealed class StorySettingsState extends Equatable {
  const StorySettingsState();

  @override
  List<Object> get props => [];
}

final class StorySettingsLoading extends StorySettingsState {}

final class StorySettingsLoaded extends StorySettingsState {
  final TextStyle style;

  const StorySettingsLoaded({required this.style});

  @override
  List<Object> get props => [style];
}

final class StorySettingsError extends StorySettingsState {
  final String message;

  const StorySettingsError(this.message);

  @override
  List<Object> get props => [message];
}
