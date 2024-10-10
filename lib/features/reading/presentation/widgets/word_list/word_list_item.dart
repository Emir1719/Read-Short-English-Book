import 'package:english_will_fly/features/reading/presentation/widgets/word_mean/bottom_sheet_widget.dart';
import 'package:english_will_fly/features/reading/util/style.dart';
import 'package:flutter/material.dart';

class WordListItem extends StatelessWidget {
  const WordListItem({super.key, required this.index, required this.word});
  final int index;
  final String word;

  @override
  Widget build(BuildContext context) {
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
        padding: EdgeInsets.all(15),
        decoration: AppStyle.wordListContainer,
        child: Row(
          children: [
            Text(
              (index + 1).toString(),
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(width: 20),
            Text(word),
          ],
        ),
      ),
    );
  }
}
