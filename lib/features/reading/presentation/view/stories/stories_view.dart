import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_list.dart';
import 'package:english_will_fly/features/reading/util/init_state/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoriesView extends StatelessWidget {
  const StoriesView({super.key, required this.level});
  final String level;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${level.toUpperCase()} Hikayeler")),
      body: BlocBuilder<ReadingBloc, ReadingState>(
        builder: (context, state) {
          if (state is ReadingLoading) {
            return const AppLoading();
          } else if (state is ReadingLoaded) {
            return StoryList(state: state);
          }
          return Container();
        },
      ),
    );
  }
}
