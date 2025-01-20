import 'package:english_will_fly/core/speech_controller.dart';
import 'package:english_will_fly/features/reading/util/color.dart';
import 'package:english_will_fly/features/text_to_speech/presentation/bloc/text_to_speech_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextToSpeechButton extends StatelessWidget {
  const TextToSpeechButton({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TextToSpeechBloc(TextToSpeechController()),
      child: BlocBuilder<TextToSpeechBloc, TextToSpeechState>(
        builder: (context, state) {
          final bloc = context.read<TextToSpeechBloc>();

          return state is TextToSpeechRunning
              ? IconButton(
                  onPressed: () => bloc.add(StopSpeaking()),
                  icon: Icon(Icons.pause),
                  style: _style(),
                )
              : IconButton(
                  onPressed: () => bloc.add(StartSpeaking(text)),
                  icon: Icon(Icons.mic_none_outlined),
                  style: _style(),
                );
        },
      ),
    );
  }

  ButtonStyle _style() {
    return ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(AppColor.profileInfoBack),
      shape: WidgetStatePropertyAll(CircleBorder()),
      foregroundColor: WidgetStatePropertyAll(Colors.white),
    );
  }
}
