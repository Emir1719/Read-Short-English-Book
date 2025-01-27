import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';

class BottomSheetBase extends StatelessWidget {
  const BottomSheetBase({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      padding: AppPadding.defaults,
      decoration: BoxDecoration(
        color: context.color.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        border: Border(top: BorderSide(color: context.color.secondary, width: 6)),
      ),
      child: child,
    );
  }
}
