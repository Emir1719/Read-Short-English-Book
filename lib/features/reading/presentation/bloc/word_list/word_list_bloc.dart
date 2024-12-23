import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:english_will_fly/features/reading/data/models/word_list.dart';
import 'package:english_will_fly/features/reading/data/repositories/word_list_repository.dart';
import 'package:equatable/equatable.dart';

part 'word_list_event.dart';
part 'word_list_state.dart';

class WordListBloc extends Bloc<WordListEvent, WordListState> {
  WordList? wordList;
  final _repository = WordListRepository();

  WordListBloc() : super(WordListInitial()) {
    on<GetAllWords>(getAllWords);
    on<SaveWord>(saveWord);
    on<RemoveWord>(removeWord);
  }

  Future<void> getAllWords(GetAllWords event, Emitter<WordListState> emit) async {
    await _fetchAndEmitWordList(emit);
  }

  Future<void> saveWord(SaveWord event, Emitter<WordListState> emit) async {
    emit(WordListLoading());

    try {
      // Yeni kelime kayıt edilir
      await _repository.saveWord(event.word);

      // Kelime kaydedildikten sonra tüm listeyi tekrar çek ve emit et
      await _fetchAndEmitWordList(emit);
    } catch (e) {
      emit(WordListError(message: e.toString()));
    }
  }

  /// Kelime listesini çeker ve duruma göre ilgili emit işlemlerini yapar.
  Future<void> _fetchAndEmitWordList(Emitter<WordListState> emit) async {
    emit(WordListLoading());

    try {
      wordList = await _repository.getAllWords();

      emit(WordListLoaded(wordList: wordList));
    } catch (e) {
      emit(WordListError(message: e.toString()));
    }
  }

  Future<void> removeWord(RemoveWord event, Emitter<WordListState> emit) async {
    emit(WordListLoading());

    try {
      await _repository.removeWord(event.word);
      await _fetchAndEmitWordList(emit);
    } catch (e) {
      emit(WordListError(message: e.toString()));
    }
  }
}
