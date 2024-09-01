import 'package:english_will_fly/features/reading/data/models/story_element.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/dictionary/dictionary_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextParse {
  TextSpan build(String text, BuildContext context, StoryElement story) {
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
        bool isDefined = story.definitions.any((def) => matchedText.toLowerCase().startsWith(def.toLowerCase()));

        if (isDefined) {
          textSpans.add(
            TextSpan(
              text: matchedText,
              style: const TextStyle(color: Colors.blue),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.read<DictionaryBloc>().add(FetchWordFromDictionary(word: matchedText));

                  showDialog(
                    context: context,
                    builder: (context) {
                      return BlocBuilder<DictionaryBloc, DictionaryState>(
                        builder: (context, state) {
                          if (state is DictionaryLoading) {
                            return const AlertDialog(
                              title: Text("Loading"),
                              content: CircularProgressIndicator(),
                            );
                          } else if (state is DictionaryWordLoaded) {
                            final meaning = state.mean;

                            return AlertDialog(
                              title: Text(matchedText),
                              content: Text(meaning),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                              ],
                            );
                          } else if (state is DictionaryError) {
                            return AlertDialog(
                              title: const Text("Hata"),
                              content: Text(state.message),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                              ],
                            );
                          } else {
                            return const SizedBox.shrink(); // Placeholder in case of an unexpected state
                          }
                        },
                      );
                    },
                  );
                },
            ),
          );
        } else {
          textSpans.add(TextSpan(text: matchedText));
        }
      } else {
        // Add space or non-word characters as is
        textSpans.add(TextSpan(text: matchedText));
      }

      start = endMatch;
    }

    return TextSpan(
      children: textSpans,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
        height: 1.6,
      ),
    );
  }
}
