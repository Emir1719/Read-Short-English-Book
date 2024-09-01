import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:english_will_fly/features/reading/data/datasources/story_api.dart';
import 'package:english_will_fly/features/reading/data/models/dictionary.dart';
import 'package:equatable/equatable.dart';

part 'dictionary_event.dart';
part 'dictionary_state.dart';

class DictionaryBloc extends Bloc<DictionaryEvent, DictionaryState> {
  final _api = StoryApi();
  List<Dictionary>? dictionary;

  DictionaryBloc() : super(DictionaryInitial()) {
    on<FetchDictionary>(fetchDictionary);
    on<FetchWordFromDictionary>(fetchWord);
  }

  Future<void> fetchDictionary(FetchDictionary event, emit) async {
    try {
      emit(DictionaryLoading());
      dictionary = await _api.loadDictionary();
      if (dictionary == null) {
        emit(const DictionaryError(message: "Sözlüğe Erişilemedi"));
        return;
      }
      emit(DictionaryLoaded(dictionary: dictionary!));
    } catch (e) {
      emit(DictionaryError(message: e.toString()));
    }
  }

  Future<void> fetchWord(FetchWordFromDictionary event, emit) async {
    try {
      emit(DictionaryLoading());
      if (dictionary == null) {
        emit(const DictionaryError(message: "Sözlüğe Erişilemedi"));
        return;
      }

      var result = dictionary?.firstWhere((e) => event.word.startsWith(e.word));

      if (result == null) {
        emit(const DictionaryError(message: "Kelime Bulunamadı"));
        return;
      }

      var mean = result.mean;
      emit(DictionaryWordLoaded(mean: mean));
    } catch (e) {
      emit(DictionaryError(message: e.toString()));
    }
  }
}
