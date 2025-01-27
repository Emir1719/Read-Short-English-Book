import 'package:easy_localization/easy_localization.dart';
import 'package:english_will_fly/features/dictionary/data/models/dictionary.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BtnWordDetail extends StatelessWidget {
  const BtnWordDetail({super.key, required this.dictionary});
  final Dictionary dictionary;

  @override
  Widget build(BuildContext context) {
    final color = context.color.tertiary;

    return TextButton.icon(
      onPressed: () {
        final scaffoldMessenger = ScaffoldMessenger.of(context);
        scaffoldMessenger.hideCurrentSnackBar();
        context.push("/wordDetail", extra: dictionary);
      },
      label: Text("home.detail", style: TextStyle(color: color)).tr(),
      icon: Icon(Icons.info_outline, color: color),
    );
  }
}
