import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';

class SelectFontButton extends StatelessWidget {
  const SelectFontButton({super.key, this.onPressed, this.icon});
  final void Function()? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, color: context.color.onSurface),
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        backgroundColor: WidgetStatePropertyAll(context.color.surfaceContainerLowest),
      ),
      onPressed: onPressed,
    );
  }
}
