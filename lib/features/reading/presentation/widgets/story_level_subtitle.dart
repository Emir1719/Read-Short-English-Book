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
    return list.isNotEmpty ? Text("${list.length} stories") : const Text("No any story");
  }
}
