import 'package:english_will_fly/features/reading/presentation/bloc/story_read/story_read_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_read/story_detail.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_read/story_read_page_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoryReadView extends StatelessWidget {
  const StoryReadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<StoryReadBloc, StoryReadState>(
          builder: (context, state) {
            final bloc = state as StoryReadLoaded;
            return Tooltip(message: bloc.story.title, child: Text(bloc.story.title));
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            StoryReadPageBuilder(), // Chapter için
            StoryDetail(),
          ],
        ),
      ),
    );
  }
}
