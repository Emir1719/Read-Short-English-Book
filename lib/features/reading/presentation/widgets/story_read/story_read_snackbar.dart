import 'package:english_will_fly/core/app_translator.dart';
import 'package:english_will_fly/core/dependency.dart';
import 'package:english_will_fly/features/reading/util/color.dart';
import 'package:english_will_fly/features/reading/util/style.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:english_will_fly/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoryReadSnackBar {
  static final _instance = StoryReadSnackBar._();
  StoryReadSnackBar._();
  factory StoryReadSnackBar() => _instance;

  static Future<void> showTranslatedText({
    required BuildContext context,
    required String text,
  }) async {
    if (!context.mounted) return;

    // Display a loading SnackBar before the translation is complete
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.hideCurrentSnackBar();
    bool isDark = context.read<ThemeBloc>().state.isDarkMode;
    Color? backgroundColor = isDark ? AppColor.scaffoldBackgroundDark : AppColor.snackbar;
    Color? closeIconColor = isDark ? AppColor.lightBlue : AppColor.secondaryDark;

    scaffoldMessenger.showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        closeIconColor: closeIconColor,
        behavior: SnackBarBehavior.floating,
        content: Container(
          decoration: AppStyle.snackbar(isDark),
          padding: EdgeInsets.all(20).copyWith(top: 5),
          child: Column(
            spacing: 10,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Çeviri", style: context.text.bodyLarge),
                  IconButton(
                    onPressed: () => scaffoldMessenger.hideCurrentSnackBar(),
                    icon: Icon(Icons.close_outlined, color: closeIconColor),
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
              CircularProgressIndicator(),
            ],
          ),
        ),
        padding: EdgeInsets.zero,
        duration:
            const Duration(seconds: 1), // Keeps the SnackBar visible until translation completes
      ),
    );

    try {
      final translator = getIt<AppTranslator>();
      String translatedText = await translator.translate(context, text);
      if (!context.mounted) return;
      scaffoldMessenger.hideCurrentSnackBar();

      // Show the translated text in a new SnackBar
      scaffoldMessenger.showSnackBar(
        SnackBar(
          backgroundColor: backgroundColor,
          closeIconColor: closeIconColor,
          content: Container(
            decoration: AppStyle.snackbar(isDark),
            padding: EdgeInsets.all(20).copyWith(top: 5),
            child: Column(
              spacing: 10,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Çeviri", style: context.text.bodyLarge),
                    IconButton(
                      onPressed: () => scaffoldMessenger.hideCurrentSnackBar(),
                      icon: Icon(Icons.close_outlined, color: closeIconColor),
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ),
                Text(
                  translatedText,
                  textAlign: TextAlign.justify,
                  style: context.text.bodyMedium?.copyWith(height: 1.6),
                  maxLines: 20,
                ),
              ],
            ),
          ),
          duration: const Duration(minutes: 1),
          behavior: SnackBarBehavior.floating,
          padding: EdgeInsets.zero,
        ),
      );
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
    required String text,
  }) async {
    if (!context.mounted) return;

    // Display a loading SnackBar before the translation is complete
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.hideCurrentSnackBar();
    bool isDark = context.read<ThemeBloc>().state.isDarkMode;
    Color? backgroundColor = isDark ? AppColor.scaffoldBackgroundDark : AppColor.snackbar;
    Color? closeIconColor = isDark ? AppColor.lightBlue : AppColor.secondaryDark;

    scaffoldMessenger.showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        closeIconColor: closeIconColor,
        behavior: SnackBarBehavior.floating,
        content: Container(
          decoration: AppStyle.snackbar(isDark),
          padding: EdgeInsets.all(20).copyWith(top: 5),
          child: Column(
            spacing: 10,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Çeviri", style: context.text.bodyLarge),
                  IconButton(
                    onPressed: () => scaffoldMessenger.hideCurrentSnackBar(),
                    icon: Icon(Icons.close_outlined, color: closeIconColor),
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
              CircularProgressIndicator(),
            ],
          ),
        ),
        padding: EdgeInsets.zero,
        duration:
            const Duration(seconds: 1), // Keeps the SnackBar visible until translation completes
      ),
    );

    try {
      final translator = getIt<AppTranslator>();
      String translatedText = await translator.translate(context, text);
      if (!context.mounted) return;
      scaffoldMessenger.hideCurrentSnackBar();

      // Show the translated text in a new SnackBar
      scaffoldMessenger.showSnackBar(
        SnackBar(
          backgroundColor: backgroundColor,
          closeIconColor: closeIconColor,
          content: Container(
            decoration: AppStyle.snackbar(isDark),
            padding: EdgeInsets.all(20).copyWith(top: 5),
            child: Column(
              spacing: 10,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Çeviri", style: context.text.bodyLarge),
                    IconButton(
                      onPressed: () => scaffoldMessenger.hideCurrentSnackBar(),
                      icon: Icon(Icons.close_outlined, color: closeIconColor),
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ),
                Text(
                  translatedText,
                  textAlign: TextAlign.justify,
                  style: context.text.bodyMedium?.copyWith(height: 1.6),
                  maxLines: 20,
                ),
              ],
            ),
          ),
          duration: const Duration(minutes: 1),
          behavior: SnackBarBehavior.floating,
          padding: EdgeInsets.zero,
        ),
      );
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
