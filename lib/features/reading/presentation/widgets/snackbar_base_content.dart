import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';

class SnackbarBaseContent extends StatelessWidget {
  const SnackbarBaseContent({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.surface,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border(
          top: BorderSide(color: context.color.secondary, width: 6),
        ),
      ),
      padding: EdgeInsets.all(20).copyWith(top: 5),
      child: child,
    );
  }
}
