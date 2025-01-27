import 'package:english_will_fly/features/reading/presentation/widgets/bottom_sheet_base.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/word_mean/bottom_sheet_top_section.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/word_mean/dictionary_word_mean.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key, required this.word});
  final String word;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        SizedBox(
          height: context.height(0.4),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: BottomSheetBase(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BottomSheetTopSection(word: word),
                  const SizedBox(height: 10),
                  DictionaryWordMean(word: word),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
