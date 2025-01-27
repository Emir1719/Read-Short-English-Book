import 'package:english_will_fly/core/speech_controller.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/story_read/story_read_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_read/story_detail_item.dart';
import 'package:english_will_fly/features/text_to_speech/presentation/bloc/text_to_speech_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextToSpeechButton extends StatelessWidget {
  const TextToSpeechButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TextToSpeechBloc(TextToSpeechController()),
      child: BlocBuilder<TextToSpeechBloc, TextToSpeechState>(
        builder: (context, state) {
          final bloc = context.read<TextToSpeechBloc>();

          return state is TextToSpeechRunning
              ? StoryDetailItem(
                  onTap: () => bloc.add(StopSpeaking()),
                  icon: Icons.pause,
                  tooltip: "Durdur",
                )
              : StoryDetailItem(
                  onTap: () {
                    final bloc2 = context.read<StoryReadBloc>().state as StoryReadLoaded;
                    PageController? controller = context.read<StoryReadBloc>().controller;
                    int index = controller?.page?.round() ?? 0;
                    final text = bloc2.story.chapters[index].paragraphs.join(" ");

                    bloc.add(StartSpeaking(text));
                  },
                  icon: Icons.mic_none_outlined,
                  tooltip: "Dinle",
                );
        },
      ),
    );
  }
}
