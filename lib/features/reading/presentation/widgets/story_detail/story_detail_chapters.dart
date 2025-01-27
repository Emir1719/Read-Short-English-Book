import 'package:english_will_fly/features/reading/presentation/bloc/story_read/story_read_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/story_read/story_detail_item.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:english_will_fly/features/reading/util/style.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoryDetailChapters extends StatelessWidget {
  const StoryDetailChapters({super.key});

  @override
  Widget build(BuildContext context) {
    return StoryDetailItem(
      icon: Icons.menu_rounded,
      tooltip: "Bölümler",
      onTap: () async {
        await showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
          ),
          backgroundColor: Colors.white,
          builder: (context) {
            final bloc = context.read<StoryReadBloc>().state as StoryReadLoaded;

            return Container(
              width: MediaQuery.of(context).size.width,
              padding: AppPadding.defaults,
              decoration: AppStyle.dictionary(context.isDark),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Text(
                        "Chapters",
                        style: context.text.titleMedium,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: bloc.story.chapters.length,
                      itemBuilder: (context, index) {
                        var chapter = bloc.story.chapters[index];

                        return ListTile(
                          leading: Text(chapter.id.toString()),
                          title: Text(chapter.title),
                          contentPadding: EdgeInsets.all(0),
                          onTap: () {
                            context.read<StoryReadBloc>().add(ChangeChapter(chapterId: chapter.id));
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
