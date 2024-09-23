import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoryLevelSubtitle extends StatelessWidget {
  const StoryLevelSubtitle({super.key, required this.level});

  final String level;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadingBloc, ReadingState>(
      bloc: ReadingBloc()..add(FetchStories(levelCode: level)),
      builder: (context, state) {
        if (state is ReadingLoading) {
          return const CircularProgressIndicator();
        } else if (state is ReadingLoaded) {
          return Text("${state.story.length} stories");
        }
        return const Text("No any story");
      },
    );
  }
}
