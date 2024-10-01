part of 'easy_localization_bloc.dart';

abstract class EasyLocalizationState extends Equatable {
  const EasyLocalizationState();

  @override
  List<Object> get props => [];
}

class EasyLocalizationInitial extends EasyLocalizationState {}

class EasyLocalizationLoading extends EasyLocalizationState {}

class EasyLocalizationErrror extends EasyLocalizationState {
  final String message;

  const EasyLocalizationErrror({required this.message});
}

class EasyLocalizationLoaded extends EasyLocalizationState {
  final Locale locale;

  const EasyLocalizationLoaded({required this.locale});
}
