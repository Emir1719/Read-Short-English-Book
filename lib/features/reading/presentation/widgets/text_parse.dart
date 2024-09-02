import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/dictionary/dictionary_bloc.dart';
import 'package:english_will_fly/features/reading/util/color.dart';
import 'package:english_will_fly/features/reading/util/init_state/error.dart';
import 'package:english_will_fly/features/reading/util/init_state/loading.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:english_will_fly/features/reading/util/style.dart';
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
        bool isDefined = story.definitions.any((def) => matchedText.toLowerCase().startsWith(def.toLowerCase()));

        if (isDefined) {
          textSpans.add(_linkedWord(matchedText, context));
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

  static TextSpan _linkedWord(String matchedText, BuildContext context) {
    return TextSpan(
      text: matchedText,
      style: TextStyle(color: AppColor.secondary),
      recognizer: TapGestureRecognizer()
        ..onTap = () async {
          context.read<DictionaryBloc>().add(FetchWordFromDictionary(word: matchedText));

          await showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 120,
                width: MediaQuery.of(context).size.width,
                padding: AppPadding.defaults,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(matchedText, style: AppStyle.dictionaryWord),
                    const SizedBox(height: 10),
                    BlocBuilder<DictionaryBloc, DictionaryState>(
                      builder: (context, state) {
                        if (state is DictionaryLoading) {
                          return const AppLoading();
                        } else if (state is DictionaryError) {
                          return AppError(message: state.message);
                        } else if (state is DictionaryWordLoaded) {
                          return Text(state.mean, style: AppStyle.dictionaryMean);
                        }
                        return const Text("...");
                      },
                    )
                  ],
                ),
              );
            },
          );
        },
    );
  }
}
