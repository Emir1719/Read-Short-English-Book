import 'package:english_will_fly/features/reading/presentation/bloc/story_read/story_read_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_read/story_read_paragraphs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoryReadPageBuilder extends StatelessWidget {
  const StoryReadPageBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoryReadBloc, StoryReadState>(
      builder: (context, state) {
        final bloc = state as StoryReadLoaded;

        return Expanded(
          child: PageView.builder(
            controller: context.read<StoryReadBloc>().controller,
            itemCount: bloc.story.chapters.length,
            itemBuilder: (context, index) {
              // paragraflar için
              return StoryReadParagraphs(chapter: bloc.story.chapters[index]);
            },
          ),
        );
      },
    );
  }
}
