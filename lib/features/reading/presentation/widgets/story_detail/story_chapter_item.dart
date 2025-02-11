import 'package:english_will_fly/features/reading/data/models/chapter.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/story_read/story_read_bloc.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class StoryChapterItem extends StatelessWidget {
  const StoryChapterItem({super.key, required this.chapter});
  final Chapter chapter;

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<StoryReadBloc>().state as StoryReadLoaded;

    return Container(
      color: bloc.currentChapterId == chapter.id
          ? context.color.inversePrimary
          : context.color.surface,
      child: InkWell(
        onTap: () {
          context.read<StoryReadBloc>().add(ChangeChapter(chapterId: chapter.id));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Text(
                "Chapter ${chapter.id}",
                style: GoogleFonts.urbanist(
                  color: context.color.surfaceContainerHigh,
                  fontSize: 14,
                ),
              ),
              Text(
                chapter.title,
                style: GoogleFonts.urbanist(
                  color: context.color.onSurface,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
