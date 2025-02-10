part of 'story_settings_bloc.dart';

sealed class StorySettingsState extends Equatable {
  const StorySettingsState();

  @override
  List<Object> get props => [];
}

final class StorySettingsLoading extends StorySettingsState {}

final class StorySettingsLoaded extends StorySettingsState {
  final TextStyle style;
  final TextAlign textAlign;

  const StorySettingsLoaded({required this.style, required this.textAlign});

  @override
  List<Object> get props => [style, textAlign];

  StorySettingsLoaded copyWith({
    TextStyle? style,
    TextAlign? textAlign,
  }) {
    return StorySettingsLoaded(
      style: style ?? this.style,
      textAlign: textAlign ?? this.textAlign,
    );
  }
}

final class StorySettingsError extends StorySettingsState {
  final String message;

  const StorySettingsError(this.message);

  @override
  List<Object> get props => [message];
}
