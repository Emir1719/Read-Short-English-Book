import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:english_will_fly/features/reading/data/datasources/story_api.dart';
import 'package:english_will_fly/features/reading/data/models/dictionary.dart';
import 'package:english_will_fly/features/reading/util/string.dart';
import 'package:equatable/equatable.dart';

part 'dictionary_event.dart';
part 'dictionary_state.dart';

class DictionaryBloc extends Bloc<DictionaryEvent, DictionaryState> {
  final _api = StoryApi();
  List<Dictionary>? _dictionary;

  DictionaryBloc() : super(DictionaryInitial()) {
    on<FetchDictionary>(fetchDictionary);
    on<FetchWordFromDictionary>(fetchWord);
  }

  Future<void> fetchDictionary(FetchDictionary event, Emitter<DictionaryState> emit) async {
    try {
      emit(DictionaryLoading());
      _dictionary = await _api.loadDictionary();
      if (_dictionary == null) {
        emit(const DictionaryError(message: "Sözlüğe Erişilemedi"));
        return;
      }
      emit(DictionaryLoaded(dictionary: _dictionary!));
    } catch (e) {
      emit(DictionaryError(message: e.toString()));
    }
  }

  Future<void> fetchWord(FetchWordFromDictionary event, Emitter<DictionaryState> emit) async {
    emit(DictionaryLoading());

    // Eğer sözlük null veya boşsa hata emiti yap
    if (_dictionary == null) {
      emit(const DictionaryError(message: "Sözlüğe Erişilemedi"));
      _dictionary = await _api.loadDictionary();
    }

    try {
      // Kelimeyi sözlükte arayın
      final result = _dictionary!.firstWhere(
        (e) => event.word.startsWith(e.word),
        orElse: () => Dictionary(word: '', mean: ''), // Varsayılan boş bir Dictionary döndür
      );

      if (result.word.isEmpty) {
        // Eğer result, varsayılan boş Dictionary dönerse hata mesajı gönder
        emit(const DictionaryError(message: "Kelime Bulunamadı"));
      } else {
        // Kelime bulunduysa tanımı yükle
        emit(DictionaryWordLoaded(mean: result.mean));
      }
    } catch (e) {
      // Hata durumunda uygun bir hata mesajı emiti yap
      emit(DictionaryError(message: AppString.error(e.toString())));
    }
  }
}
