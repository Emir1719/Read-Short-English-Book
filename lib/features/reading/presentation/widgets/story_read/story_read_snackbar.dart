import 'package:english_will_fly/features/reading/presentation/widgets/snackbar_base_content.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/word_mean/bottom_sheet_top_section.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/word_mean/dictionary_word_mean.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/word_mean/snackbar_top_panel.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/word_mean/snackbar_translated_text.dart';
import 'package:english_will_fly/features/text_to_speech/presentation/pages/text_to_speech_view.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class StoryReadSnackBar {
  static final _instance = StoryReadSnackBar._();
  StoryReadSnackBar._();
  factory StoryReadSnackBar() => _instance;
  static final _analytics = FirebaseAnalytics.instance;

  static Future<void> showTranslatedText({
    required BuildContext context,
    required String text,
  }) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.hideCurrentSnackBar();

    try {
      if (!context.mounted) return;

      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: SnackbarBaseContent(
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SnackbarTopPanel(),
                SnackbarTranslatedText(text: text),
              ],
            ),
          ),
          duration: const Duration(minutes: 1),
          behavior: SnackBarBehavior.floating,
          padding: EdgeInsets.zero,
        ),
      );

      await _analytics.logEvent(name: "story_translate");
    } catch (e) {
      debugPrint(e.toString());
      scaffoldMessenger.hideCurrentSnackBar();

      // Show an error message
      scaffoldMessenger.showSnackBar(
        SnackBar(
          showCloseIcon: true,
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Translation failed: ${e.toString()}',
            maxLines: 10,
          ),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 5),
        ),
      );
    }
  }

  static Future<void> showWordMean({
    required BuildContext context,
    required String word,
  }) async {
    if (!context.mounted) return;

    // Display a loading SnackBar before the translation is complete
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.hideCurrentSnackBar();

    try {
      if (!context.mounted) return;
      scaffoldMessenger.hideCurrentSnackBar();

      // Show the translated text in a new SnackBar
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: SnackbarBaseContent(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                BottomSheetTopSection(word: word),
                DictionaryWordMean(word: word),
              ],
            ),
          ),
          duration: const Duration(minutes: 1),
          behavior: SnackBarBehavior.floating,
          padding: EdgeInsets.zero,
        ),
      );

      await _analytics.logEvent(name: "story_word_mean");
    } catch (e) {
      debugPrint(e.toString());
      scaffoldMessenger.hideCurrentSnackBar();

      // Show an error message
      scaffoldMessenger.showSnackBar(
        SnackBar(
          showCloseIcon: true,
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Translation failed: ${e.toString()}',
            maxLines: 10,
          ),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 5),
        ),
      );
    }
  }

  static Future<void> showSpeech({
    required BuildContext context,
    required String word,
  }) async {
    if (!context.mounted) return;

    // Display a loading SnackBar before the translation is complete
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.hideCurrentSnackBar();

    try {
      if (!context.mounted) return;
      scaffoldMessenger.hideCurrentSnackBar();

      // Show the translated text in a new SnackBar
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: SnackbarBaseContent(
            child: TextToSpeechScreen(textToSpeak: word),
          ),
          duration: const Duration(minutes: 1),
          behavior: SnackBarBehavior.floating,
          padding: EdgeInsets.zero,
        ),
      );

      await _analytics.logEvent(name: "story_listen");
    } catch (e) {
      debugPrint(e.toString());
      scaffoldMessenger.hideCurrentSnackBar();

      // Show an error message
      scaffoldMessenger.showSnackBar(
        SnackBar(
          showCloseIcon: true,
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Translation failed: ${e.toString()}',
            maxLines: 10,
          ),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 5),
        ),
      );
    }
  }
}
