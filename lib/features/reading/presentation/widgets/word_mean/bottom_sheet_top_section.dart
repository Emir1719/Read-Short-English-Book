import 'package:english_will_fly/features/reading/util/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
          onPressed: () => context.pop(),
          icon: Icon(Icons.close),
        )
      ],
    );
  }
}
