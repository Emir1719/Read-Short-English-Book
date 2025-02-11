import 'package:english_will_fly/features/reading/presentation/widgets/word_mean/snackbar_translated_text.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';

class WordExample extends StatelessWidget {
  const WordExample({super.key, this.value});
  final String? value;

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 8);

    if (value == null) {
      return const SizedBox.shrink();
    }

    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Example:",
            style: textTheme.bodyLarge?.copyWith(
              color: context.color.onSurface,
            ),
          ),
          space,
          Text(
            value ?? "",
            style: textTheme.bodyMedium,
            maxLines: 10,
          ),
          space,
          SnackbarTranslatedText(text: value?.trim() ?? ""),
        ],
      ),
    );
  }
}
