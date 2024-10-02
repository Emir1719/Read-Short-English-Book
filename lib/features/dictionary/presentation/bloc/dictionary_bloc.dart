import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:english_will_fly/features/dictionary/data/models/dictionary.dart';
import 'package:english_will_fly/features/dictionary/data/repositories/i_dictionary_repository.dart';
import 'package:english_will_fly/features/reading/util/string.dart';
import 'package:equatable/equatable.dart';

part 'dictionary_event.dart';
part 'dictionary_state.dart';

class DictionaryBloc extends Bloc<DictionaryEvent, DictionaryState> {
  final IDictionaryRepository _repository;

  DictionaryBloc(this._repository) : super(DictionaryInitial()) {
    on<GetMean>(getMean);
  }

  Future<void> getMean(GetMean event, emit) async {
    emit(DictionaryLoading());
    try {
      final list = await _repository.getMean(event.word);
      if (list.isEmpty) {
        emit(DictionaryError(message: "Liste boş"));
        return;
      }
      emit(DictionaryLoaded(dictionaryList: list));
    } catch (e) {
      emit(DictionaryError(message: AppString.error(e.toString())));
    }
  }
}
