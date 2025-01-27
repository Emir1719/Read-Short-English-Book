import 'package:english_will_fly/features/reading/presentation/bloc/story_read/story_read_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_read/story_read_paragraphs.dart';
import 'package:english_will_fly/features/reading/util/init_state/error.dart';
import 'package:english_will_fly/features/reading/util/init_state/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoryReadPageBuilder extends StatelessWidget {
  const StoryReadPageBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();

    return BlocBuilder<StoryReadBloc, StoryReadState>(
      builder: (context, state) {
        if (state is StoryReadLoaded) {
          return Expanded(
            child: BlocListener<StoryReadBloc, StoryReadState>(
              listener: (context, state) {
                int index = (state as StoryReadLoaded).currentChapterId - 1;
                controller.jumpToPage(index);
              },
              child: PageView.builder(
                controller: controller,
                itemCount: state.story.chapters.length,
                onPageChanged: (value) {
                  context.read<StoryReadBloc>().add(ChangeChapter(chapterId: value + 1));
                },
                itemBuilder: (context, index) {
                  // paragraflar için
                  return StoryReadParagraphs(chapter: state.story.chapters[index]);
                },
              ),
            ),
          );
        } else if (state is StoryReadError) {
          return AppError(message: state.message);
        } else if (state is StoryReadLoading) {
          return AppLoading();
        }

        return SizedBox();
      },
    );
  }
}
