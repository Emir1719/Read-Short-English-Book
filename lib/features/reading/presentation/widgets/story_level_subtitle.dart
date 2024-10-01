import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoryLevelSubtitle extends StatelessWidget {
  const StoryLevelSubtitle({super.key, required this.level});
  final String level;

  @override
  Widget build(BuildContext context) {
    var stories = context.read<ReadingBloc>().stories;

    var list = stories?.where((element) => element.level.toLowerCase() == level.toLowerCase()).toList() ?? [];
    return list.isNotEmpty
        ? Text("storyLevel.subtitle".tr(namedArgs: {"count": list.length.toString()}))
        : const Text("storyLevel.subtitleError").tr();
  }
}
