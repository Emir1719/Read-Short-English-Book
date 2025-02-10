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

class ChangeAlign extends StorySettingsEvent {
  final TextAlign textAlign;

  const ChangeAlign(this.textAlign);

  @override
  List<Object> get props => [textAlign];
}

class RefreshSettings extends StorySettingsEvent {
  final Color? color;

  const RefreshSettings(this.color);

  @override
  List<Object> get props => [color ?? true];
}
