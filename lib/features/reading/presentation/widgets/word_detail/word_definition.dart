import 'package:english_will_fly/features/reading/presentation/widgets/word_mean/snackbar_translated_text.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';

class WordDefinition extends StatelessWidget {
  const WordDefinition({super.key, required this.value});
  final String? value;

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 8);
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Definition:",
            style: textTheme.bodyLarge?.copyWith(
              color: context.color.tertiary,
            ),
          ),
          space,
          SnackbarTranslatedText(text: value?.trim() ?? ""),
        ],
      ),
    );
  }
}
