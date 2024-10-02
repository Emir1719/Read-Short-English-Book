import 'package:english_will_fly/features/reading/util/style.dart';
import 'package:flutter/material.dart';

class BottomSheetTopSection extends StatelessWidget {
  const BottomSheetTopSection({super.key, required this.word});
  final String word;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(word, style: AppStyle.dictionaryWord),
        IconButton(
          color: Colors.blue,
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close),
        )
      ],
    );
  }
}
