import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/word_list/word_list_item.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:flutter/material.dart';

class WordListView extends StatelessWidget {
  const WordListView({super.key, required this.words});
  final List<String> words;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("word_list.title").tr()),
      body: ListView.separated(
        itemCount: words.length,
        padding: AppPadding.defaults,
        separatorBuilder: (context, index) => SizedBox(height: 20),
        itemBuilder: (context, index) {
          final word = words[index].trim().toLowerCase();

          return WordListItem(index: index, word: word);
        },
      ),
    );
  }
}
