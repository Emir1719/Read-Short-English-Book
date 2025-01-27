import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';

class SnackbarTopPanel extends StatelessWidget {
  const SnackbarTopPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Çeviri", style: context.text.bodyLarge),
        IconButton(
          onPressed: () => scaffoldMessenger.hideCurrentSnackBar(),
          icon: Icon(Icons.close_outlined, color: context.color.tertiary),
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }
}
