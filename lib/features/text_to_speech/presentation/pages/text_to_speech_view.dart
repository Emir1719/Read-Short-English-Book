import 'package:english_will_fly/core/speech_controller.dart';
import 'package:english_will_fly/features/text_to_speech/presentation/bloc/text_to_speech_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextToSpeechScreen extends StatelessWidget {
  final String textToSpeak;

  const TextToSpeechScreen({super.key, required this.textToSpeak});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TextToSpeechBloc(TextToSpeechController()),
      child: TextToSpeechView(textToSpeak: textToSpeak),
    );
  }
}

class TextToSpeechView extends StatefulWidget {
  final String textToSpeak;

  const TextToSpeechView({super.key, required this.textToSpeak});

  @override
  _TextToSpeechViewState createState() => _TextToSpeechViewState();
}

class _TextToSpeechViewState extends State<TextToSpeechView> {
  double _sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextToSpeechBloc, TextToSpeechState>(
      builder: (context, state) {
        final bloc = context.read<TextToSpeechBloc>();

        // Total words and current index
        final totalWords = state is TextToSpeechRunning ? state.words.length : 1;
        final currentWordIndex = state is TextToSpeechRunning ? state.currentWordIndex : 0;

        // Update slider value only if the state is updating
        if (state is TextToSpeechRunning) {
          _sliderValue = currentWordIndex / totalWords;
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Slider for Progress
              Slider(
                value: _sliderValue,
                onChanged: (value) {
                  // Update slider value locally for immediate feedback
                  setState(() {
                    _sliderValue = value;
                  });
                },
                onChangeEnd: (value) {
                  // Dispatch event when user finishes dragging
                  final newIndex = (value * totalWords).round();
                  bloc.add(UpdateProgress(currentWordIndex: newIndex));
                },
                min: 0,
                max: 1,
                divisions: totalWords > 1 ? totalWords - 1 : null,
                label: '${(_sliderValue * 100).round()}%',
              ),
              const SizedBox(height: 20),

              // Control buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      bloc.add(StartSpeaking(widget.textToSpeak));
                    },
                    child: const Text('Start'),
                  ),
                  ElevatedButton(
                    onPressed:
                        state is TextToSpeechRunning ? () => bloc.add(PauseSpeaking()) : null,
                    child: const Text('Pause'),
                  ),
                  ElevatedButton(
                    onPressed:
                        state is TextToSpeechPaused ? () => bloc.add(ResumeSpeaking()) : null,
                    child: const Text('Resume'),
                  ),
                  ElevatedButton(
                    onPressed:
                        state is! TextToSpeechInitial ? () => bloc.add(StopSpeaking()) : null,
                    child: const Text('Stop'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
