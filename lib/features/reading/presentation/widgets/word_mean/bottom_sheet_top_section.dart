import 'package:english_will_fly/features/reading/util/color.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
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
          color: context.isDark ? AppColor.lightBlue : Colors.blue,
          padding: EdgeInsets.zero,
          onPressed: () => context.pop(),
          icon: Icon(Icons.close),
        )
      ],
    );
  }
}
