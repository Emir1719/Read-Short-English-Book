import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/word_mean/bottom_sheet_widget.dart';
import 'package:english_will_fly/features/reading/util/color.dart';
import 'package:english_will_fly/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextParse {
  static TextSpan build(String text, BuildContext context, Story story) {
    List<TextSpan> textSpans = [];
    int start = 0;

    // Split the text into words and spaces
    RegExp wordRegex = RegExp(r'(\b\w+\b)|(\s+)');
    Iterable<RegExpMatch> matches = wordRegex.allMatches(text);

    for (var match in matches) {
      // Get the matched text
      String matchedText = match.group(0)!;
      int startMatch = match.start;
      int endMatch = match.end;

      // Add text before the current match
      if (start < startMatch) {
        textSpans.add(TextSpan(text: text.substring(start, startMatch)));
      }

      // Check if the matched text is a word and if it is in definitions
      if (RegExp(r'\b\w+\b').hasMatch(matchedText)) {
        bool isDefined =
            story.definitions.any((def) => matchedText.toLowerCase().startsWith(def.toLowerCase()));

        if (isDefined) {
          bool isDark = context.read<ThemeBloc>().state.isDarkMode;

          textSpans.add(_linkedWord(
            matchedText,
            context,
            isDark ? AppColor.lightBlue : AppColor.secondary,
          ));
        } else {
          //textSpans.add(TextSpan(text: matchedText));
          textSpans.add(_linkedWord(matchedText, context, null));
        }
      } else {
        // Add space or non-word characters as is
        textSpans.add(TextSpan(text: matchedText));
      }

      start = endMatch;
    }

    final textTheme = Theme.of(context).textTheme;

    return TextSpan(
      children: textSpans,
      style: textTheme.bodyLarge?.copyWith(height: 1.7),
    );
  }

  static TextSpan _linkedWord(String matchedText, BuildContext context, Color? color) {
    final textTheme = Theme.of(context).textTheme;

    return TextSpan(
      text: matchedText,
      style: textTheme.bodyLarge?.copyWith(height: 1.7, color: color),
      recognizer: TapGestureRecognizer()
        ..onTap = () => showModalBottomSheet(
              context: context,
              enableDrag: false,
              builder: (BuildContext context) {
                return BottomSheetWidget(word: matchedText);
              },
            ),
    );
  }
}
