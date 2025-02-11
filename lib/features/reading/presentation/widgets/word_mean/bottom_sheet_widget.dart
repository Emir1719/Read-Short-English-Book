import 'package:english_will_fly/features/reading/presentation/widgets/bottom_sheet_base.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/word_mean/bottom_sheet_top_section.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/word_mean/dictionary_word_mean.dart';
import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key, required this.word});
  final String word;

  @override
  Widget build(BuildContext context) {
    return BottomSheetBase(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          BottomSheetTopSection(word: word),
          DictionaryWordMean(word: word),
        ],
      ),
    );
  }
}
