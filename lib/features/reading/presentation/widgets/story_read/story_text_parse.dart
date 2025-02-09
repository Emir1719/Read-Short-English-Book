import 'package:english_will_fly/features/reading/presentation/widgets/story_read/story_read_snackbar.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/word_mean/text_parse.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoryTextParse extends StatelessWidget {
  const StoryTextParse({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    final style = GoogleFonts.urbanist(height: 1.7, fontSize: 18, color: context.color.onSurface);

    return GestureDetector(
      onLongPress: () async {
        await StoryReadSnackBar.showTranslatedText(context: context, text: text);
      },
      child: Padding(
        padding: AppPadding.storyRead,
        child: RichText(
          text: TextParse(style).build(text, context),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
