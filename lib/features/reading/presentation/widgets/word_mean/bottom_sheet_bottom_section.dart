import 'package:english_will_fly/features/dictionary/data/models/phonetic.dart';
import 'package:english_will_fly/features/dictionary/presentation/bloc/dictionary_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/word_mean/btn_add_word_list.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/word_mean/btn_play_sound.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/word_mean/btn_word_detail.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/word_mean/snackbar_translated_text.dart';
import 'package:flutter/material.dart';

class BottomSheetBottomSection extends StatelessWidget {
  const BottomSheetBottomSection({super.key, required this.state, required this.word});
  final DictionaryLoaded state;
  final String word;

  @override
  Widget build(BuildContext context) {
    List<Phonetic>? phonetics = state.dictionaryList.first.phonetics;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      spacing: 15,
      children: [
        // text: state.dictionaryList.first.meanings?.first.definitions?.first.definition ?? "",
        SnackbarTranslatedText(text: word),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BtnPlaySound(phonetics: phonetics),
            Row(
              children: [
                BtnAddWordList(word: word),
                SizedBox(width: 10),
                BtnWordDetail(dictionary: state.dictionaryList.first),
              ],
            )
          ],
        )
      ],
    );
  }
}
