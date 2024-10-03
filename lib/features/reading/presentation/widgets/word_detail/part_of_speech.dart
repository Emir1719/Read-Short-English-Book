import 'package:english_will_fly/features/reading/util/color.dart';
import 'package:flutter/material.dart';

class PartOfSpeech extends StatelessWidget {
  const PartOfSpeech({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Part Of Speech: ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        Chip(
          label: Text(label),
          backgroundColor: AppColor.secondary,
          side: const BorderSide(style: BorderStyle.none),
          labelStyle: TextStyle(color: Colors.white),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ],
    );
  }
}
