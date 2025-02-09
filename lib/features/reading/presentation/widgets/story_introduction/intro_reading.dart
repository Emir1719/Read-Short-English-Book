import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IntroReading extends StatelessWidget {
  const IntroReading({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.pushReplacement("/read"),
      child: Text(
        "Okumaya Başla",
        style: context.text.bodyMedium?.copyWith(
          color: context.color.onPrimary,
        ),
      ),
    );
  }
}
