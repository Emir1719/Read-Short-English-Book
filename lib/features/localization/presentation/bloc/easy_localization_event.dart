part of 'easy_localization_bloc.dart';

abstract class EasyLocalizationEvent extends Equatable {
  const EasyLocalizationEvent();

  @override
  List<Object> get props => [];
}

class ChangeLocaleEvent extends EasyLocalizationEvent {
  final Locale locale;

  const ChangeLocaleEvent(this.locale);
}
