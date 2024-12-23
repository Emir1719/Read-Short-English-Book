import 'package:english_will_fly/features/dictionary/data/models/phonetic.dart';
import 'package:english_will_fly/features/dictionary/presentation/bloc/dictionary_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/word_mean/btn_add_word_list.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/word_mean/btn_play_sound.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/word_mean/btn_word_detail.dart';
import 'package:flutter/material.dart';

class BottomSheetBottomSection extends StatelessWidget {
  const BottomSheetBottomSection({super.key, required this.state, required this.word});
  final DictionaryLoaded state;
  final String word;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    List<Phonetic>? phonetics = state.dictionaryList.first.phonetics;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          state.dictionaryList.first.meanings?.first.definitions?.first.definition ?? "",
          style: textTheme.bodyMedium?.copyWith(height: 1.5),
          maxLines: 10,
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: 10),
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
