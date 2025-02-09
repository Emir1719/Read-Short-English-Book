import 'package:english_will_fly/features/reading/presentation/widgets/story_read/story_read_snackbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextParse {
  final TextStyle _style;

  TextParse(this._style);

  TextSpan build(String text, BuildContext context) {
    List<TextSpan> textSpans = [];
    int start = 0;

    // Split the text into words and spaces, including punctuation
    RegExp wordRegex = RegExp(r'(\b\w+\b|\s+|[.,!?;:])');
    Iterable<RegExpMatch> matches = wordRegex.allMatches(text);

    for (var match in matches) {
      // Get the matched text
      String matchedText = match.group(0)!;
      int startMatch = match.start;
      int endMatch = match.end;

      // Add text before the current match
      if (start < startMatch) {
        textSpans.add(TextSpan(text: text.substring(start, startMatch), style: _style));
      }

      // Check if the matched text is a word and if it is in definitions
      if (RegExp(r'\b\w+\b').hasMatch(matchedText)) {
        textSpans.add(_linkedWord(matchedText, context, null));
      } else {
        // Add space or non-word characters (e.g., punctuation) as is
        textSpans.add(TextSpan(text: matchedText, style: _style));
      }

      start = endMatch;
    }

    return TextSpan(children: textSpans, style: _style);
  }

  TextSpan _linkedWord(String matchedText, BuildContext context, Color? color) {
    return TextSpan(
      text: matchedText,
      style: _style,
      recognizer: TapGestureRecognizer()
        ..onTap = () async => StoryReadSnackBar.showWordMean(context: context, word: matchedText),
    );
  }
}
