import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/word_mean/bottom_sheet_widget.dart';
import 'package:flutter/material.dart';

class WordListView extends StatelessWidget {
  const WordListView({super.key, required this.words});
  final List<String> words;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("word_list.title").tr()),
      body: ListView.builder(
        itemCount: words.length,
        itemBuilder: (context, index) {
          final word = words[index].trim().toLowerCase();

          return ListTile(
            onTap: () {
              showModalBottomSheet(
                context: context,
                enableDrag: false,
                builder: (BuildContext context) {
                  return BottomSheetWidget(word: word);
                },
              );
            },
            title: Text(word),
            tileColor: index % 2 == 0 ? Colors.grey.shade200 : Colors.white,
          );
        },
      ),
    );
  }
}
