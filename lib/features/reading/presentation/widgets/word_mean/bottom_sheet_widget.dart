import 'package:english_will_fly/features/reading/presentation/widgets/word_mean/bottom_sheet_top_section.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/word_mean/dictionary_word_mean.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:english_will_fly/features/reading/util/style.dart';
import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key, required this.word});
  final String word;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: AppPadding.defaults,
          decoration: AppStyle.dictionary,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BottomSheetTopSection(word: word),
              const SizedBox(height: 10),
              DictionaryWordMean(word: word),
            ],
          ),
        ),
      ],
    );
  }
}