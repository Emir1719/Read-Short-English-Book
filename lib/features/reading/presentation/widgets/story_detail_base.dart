import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';

class StoryDetailBase extends StatelessWidget {
  const StoryDetailBase({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(left: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: child,
    );
  }
}
