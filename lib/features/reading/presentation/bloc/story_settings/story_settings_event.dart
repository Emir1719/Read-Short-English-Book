part of 'story_settings_bloc.dart';

sealed class StorySettingsEvent extends Equatable {
  const StorySettingsEvent();

  @override
  List<Object> get props => [];
}

class ChangeStyle extends StorySettingsEvent {
  final TextStyle style;

  const ChangeStyle(this.style);

  @override
  List<Object> get props => [style];
}
