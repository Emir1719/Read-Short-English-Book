import 'package:english_will_fly/features/reading/presentation/bloc/story_read/story_read_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoryReadAppbar extends StatelessWidget implements PreferredSizeWidget {
  const StoryReadAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back), // Geri dönme butonu
        onPressed: () {
          Navigator.pop(context); // Geri gitmek için
        },
      ),
      title: BlocBuilder<StoryReadBloc, StoryReadState>(
        builder: (context, state) {
          final bloc = state as StoryReadLoaded;
          return Tooltip(message: bloc.story.title, child: Text(bloc.story.title));
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
