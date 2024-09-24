import 'package:english_will_fly/features/reading/presentation/bloc/reading_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoryLevelSubtitle extends StatelessWidget {
  const StoryLevelSubtitle({super.key, required this.level});

  final String level;

  @override
  Widget build(BuildContext context) {
    var list = context.read<ReadingBloc>().stories!.where((element) => element.level == level.toLowerCase()).toList();

    return list.isNotEmpty ? Text("${list.length} stories") : const Text("No any story");
  }
}
