import 'package:english_will_fly/features/dictionary/data/models/definition.dart';
import 'package:english_will_fly/features/dictionary/data/models/dictionary.dart';
import 'package:english_will_fly/features/dictionary/data/models/meaning.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/word_detail/part_of_speech.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/word_detail/word_definition.dart';
import 'package:english_will_fly/features/reading/presentation/widgets/word_detail/wrod_example.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:flutter/material.dart';

class WordDetailView extends StatelessWidget {
  const WordDetailView({super.key, required this.dictionary});
  final Dictionary dictionary;

  @override
  Widget build(BuildContext context) {
    List<Meaning> meaning = dictionary.meanings ?? [];
    String? word = dictionary.word ?? "";

    return Scaffold(
      appBar: AppBar(title: Text(word)),
      body: ListView.builder(
        shrinkWrap: true,
        padding: AppPadding.defaults,
        itemCount: meaning.length,
        itemBuilder: (context, index) {
          var mean = meaning[index];

          return Column(
            children: [
              PartOfSpeech(label: mean.partOfSpeech ?? ""),
              SizedBox(height: 10),
              ...mean.definitions!.map((Definition definitions) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WordDefinition(value: definitions.definition),
                    const SizedBox(height: 6),
                    WordExample(value: definitions.example),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 5),
                      child: Divider(),
                    ),
                  ],
                );
              }),
            ],
          );
        },
      ),
    );
  }
}
