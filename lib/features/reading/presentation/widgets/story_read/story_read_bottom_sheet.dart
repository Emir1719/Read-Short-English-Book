import 'package:english_will_fly/core/app_translator.dart';
import 'package:english_will_fly/core/dependency.dart';
import 'package:english_will_fly/core/future_ext.dart';
import 'package:english_will_fly/features/reading/util/padding.dart';
import 'package:english_will_fly/features/reading/util/style.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';

class StoryReadBottomSheet extends StatelessWidget {
  const StoryReadBottomSheet({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    final translator = getIt<AppTranslator>();

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: AppPadding.defaults,
      decoration: AppStyle.dictionary(context.isDark),
      child: translator.translate(context, text).builder(
        onSuccess: (context, snapshot) {
          return Text(
            snapshot.requireData,
            maxLines: 20,
            textAlign: TextAlign.justify,
            style: context.text.bodyMedium?.copyWith(height: 1.6),
          );
        },
      ),
    );
  }
}
