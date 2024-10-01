import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'easy_localization_event.dart';
part 'easy_localization_state.dart';

class EasyLocalizationBloc extends Bloc<EasyLocalizationEvent, EasyLocalizationState> {
  EasyLocalizationBloc() : super(EasyLocalizationInitial()) {
    on<ChangeLocaleEvent>(changeLocale);
  }

  Future<void> changeLocale(ChangeLocaleEvent event, Emitter<EasyLocalizationState> emit) async {
    try {
      emit(EasyLocalizationLoading());
      emit(EasyLocalizationLoaded(locale: event.locale));
    } catch (e) {
      emit(EasyLocalizationErrror(message: e.toString()));
    }
  }
}
