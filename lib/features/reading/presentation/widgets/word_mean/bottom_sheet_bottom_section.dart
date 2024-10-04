import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/dictionary/presentation/bloc/dictionary_bloc.dart';
import 'package:english_will_fly/features/reading/presentation/view/word_detail/word_detail_view.dart';
import 'package:english_will_fly/features/reading/util/style.dart';
import 'package:flutter/material.dart';

class BottomSheetBottomSection extends StatelessWidget {
  const BottomSheetBottomSection({super.key, required this.state});
  final DictionaryLoaded state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          state.dictionaryList.first.meanings?.first.definitions?.first.definition ?? "",
          style: AppStyle.dictionaryMean,
          maxLines: 10,
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: 10),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WordDetailView(dictionary: state.dictionaryList.first),
                ),
              );
            },
            label: Text("home.detail").tr(),
            icon: Icon(Icons.info_rounded),
          ),
        )
      ],
    );
  }
}
