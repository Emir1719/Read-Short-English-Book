import 'package:cached_network_image/cached_network_image.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/story_read/story_read_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoryImage extends StatelessWidget {
  const StoryImage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final percent = 0.25;
    final bloc = context.read<StoryReadBloc>().state as StoryReadLoaded;

    return Hero(
      tag: bloc.story.id,
      child: CachedNetworkImage(
        imageUrl: bloc.story.image,
        placeholder: (context, url) => SizedBox.shrink(),
        errorWidget: (context, url, error) => Icon(Icons.error, color: Colors.red),
        height: size.height * percent,
        width: size.width,
        fit: BoxFit.cover,
      ),
    );
  }
}
