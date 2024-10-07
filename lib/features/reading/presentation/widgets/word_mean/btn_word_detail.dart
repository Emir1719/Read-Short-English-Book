import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/dictionary/data/models/dictionary.dart';
import 'package:english_will_fly/features/reading/presentation/view/word_detail/word_detail_view.dart';
import 'package:flutter/material.dart';

class BtnWordDetail extends StatelessWidget {
  const BtnWordDetail({super.key, required this.dictionary});
  final Dictionary dictionary;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WordDetailView(dictionary: dictionary),
          ),
        );
      },
      label: Text("home.detail").tr(),
      icon: Icon(Icons.info_rounded),
    );
  }
}
