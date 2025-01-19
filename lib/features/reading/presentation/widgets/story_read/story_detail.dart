import 'package:english_will_fly/features/reading/data/models/story.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_read/story_detail_item.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_read/text_to_speech_button.dart';
import 'package:english_will_fly/features/reading/util/color.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoryDetail extends StatelessWidget {
  const StoryDetail({super.key, required this.story});
  final Story story;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.isDark ? AppColor.storyDetailDark : AppColor.storyDetail,
      padding: AppPadding.storyDetailPanel,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<ReadingBloc, ReadingState>(
            builder: (context, state) {
              story.isLiked = context.read<ReadingBloc>().getStoryById(story.id).isLiked;

              return StoryDetailItem(
                icon: story.isLiked ? Icons.favorite_outlined : Icons.favorite_outline_rounded,
                tooltip: "Beğen",
                onTap: () {
                  context.read<ReadingBloc>().add(StoryToggleLiked(
                        storyId: story.id.toString(),
                        levelCode: story.level.toLowerCase(),
                      ));
                },
              );
            },
          ),
          StoryDetailItem(
            icon: Icons.bookmark_border_rounded,
            tooltip: "Favoriye Ekle",
            onTap: () => print("Favoriye"),
          ),
          StoryDetailItem(
            icon: Icons.share_outlined,
            tooltip: "Paylaş",
            onTap: () => print("Paylaş"),
          ),
          TextToSpeechButton(text: story.paragraphs.join(". ")),
        ],
      ),
    );
  }
}
