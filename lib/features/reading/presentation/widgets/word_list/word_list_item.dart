import 'package:english_will_fly/features/reading/presentation/widgets/word_mean/bottom_sheet_widget.dart';
import 'package:english_will_fly/features/reading/util/style.dart';
import 'package:flutter/material.dart';

class WordListItem extends StatelessWidget {
  const WordListItem({super.key, required this.index, required this.word});
  final int index;
  final String word;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          enableDrag: false,
          builder: (BuildContext context) {
            return BottomSheetWidget(word: word);
          },
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: AppStyle.level,
        child: ListTile(
          title: Text(word, style: textTheme.bodyMedium),
          leading: Text(
            "${index + 1}",
            style: textTheme.bodyLarge?.copyWith(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
