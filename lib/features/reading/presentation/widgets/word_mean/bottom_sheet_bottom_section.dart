import 'package:english_will_fly/features/dictionary/presentation/bloc/dictionary_bloc.dart';
import 'package:english_will_fly/features/reading/util/style.dart';
import 'package:flutter/material.dart';

class BottomSheetBottomSection extends StatelessWidget {
  const BottomSheetBottomSection({super.key, required this.state});
  final DictionaryLoaded state;

  @override
  Widget build(BuildContext context) {
    // final meaning = state.dictionaryList.first.meanings ?? [];

    return Text(
      state.dictionaryList.first.meanings?.first.definitions?.first.definition ?? "",
      style: AppStyle.dictionaryMean,
      maxLines: 10,
      textAlign: TextAlign.justify,
    );
  }
}
