import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';

class StoryDetailItem extends StatelessWidget {
  const StoryDetailItem({super.key, this.tooltip, this.icon, this.onTap});
  final String? tooltip;
  final IconData? icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Tooltip(
        message: tooltip,
        child: Container(
          decoration: BoxDecoration(
            color: context.color.surface,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: context.color.surfaceContainerLow),
          ),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          child: Icon(icon, color: context.color.surfaceContainerHighest),
        ),
      ),
    );
  }
}
