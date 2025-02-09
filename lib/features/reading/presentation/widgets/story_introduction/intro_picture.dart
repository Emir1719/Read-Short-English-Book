import 'package:cached_network_image/cached_network_image.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/story_read/story_read_bloc.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IntroPicture extends StatelessWidget {
  const IntroPicture({super.key});

  @override
  Widget build(BuildContext context) {
    final blocState = context.watch<StoryReadBloc>().state as StoryReadLoaded;
    final story = blocState.story;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Hero(
          tag: story.id,
          child: SizedBox(
            height: context.height(0.5),
            width: context.width(0.7),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: AspectRatio(
                aspectRatio: 3 / 5,
                child: CachedNetworkImage(
                  imageUrl: story.thumbnail,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.image_not_supported, size: 50),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
