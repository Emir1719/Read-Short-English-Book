import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/story_read/story_read_bloc.dart';

class StoryIntroductionView extends StatelessWidget {
  const StoryIntroductionView({super.key});

  @override
  Widget build(BuildContext context) {
    final blocState = context.watch<StoryReadBloc>().state as StoryReadLoaded;
    final story = blocState.story;

    return Scaffold(
      appBar: AppBar(title: Text(story.title)),
      body: ListView(
        children: [
          _buildThumbnail(story),
          const SizedBox(height: 16),
          _buildStoryInfo(story),
          const Spacer(),
          _buildStartReadingButton(context),
        ],
      ),
    );
  }

  Widget _buildThumbnail(Story story) {
    return Hero(
      tag: story.id,
      child: AspectRatio(
        aspectRatio: 3 / 3,
        child: CachedNetworkImage(
          imageUrl: story.thumbnail,
          fit: BoxFit.cover,
          placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.image_not_supported, size: 50),
        ),
      ),
    );
  }

  Widget _buildStoryInfo(Story story) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            story.level,
          ),
          const SizedBox(height: 4),
          Text(
            story.category.title.tr(),
          ),
          const SizedBox(height: 4),
          Text(
            "${story.chapters.length} chapters",
          ),
        ],
      ),
    );
  }

  Widget _buildStartReadingButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => context.pushReplacement("/read"),
        child: Text(
          "Okumaya Başla",
          style: context.text.bodyMedium,
        ),
      ),
    );
  }
}
