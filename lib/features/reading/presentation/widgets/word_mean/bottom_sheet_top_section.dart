import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomSheetTopSection extends StatelessWidget {
  const BottomSheetTopSection({super.key, required this.word});
  final String word;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(word, style: textTheme.bodyLarge),
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
