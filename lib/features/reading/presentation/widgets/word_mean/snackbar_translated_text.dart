import 'package:english_will_fly/core/app_translator.dart';
import 'package:english_will_fly/core/dependency.dart';
import 'package:english_will_fly/features/reading/util/init_state/loading.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';

class SnackbarTranslatedText extends StatelessWidget {
  const SnackbarTranslatedText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    final translator = getIt<AppTranslator>();

    return FutureBuilder<String>(
      future: translator.translate(context, text),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return AppLoading();
        } else if (snapshot.connectionState == ConnectionState.done) {
          // If data is available
          if (snapshot.hasData) {
            return Text(
              snapshot.requireData,
              textAlign: TextAlign.justify,
              style: context.text.bodyMedium?.copyWith(height: 1.6),
              maxLines: 20,
            );
          } else if (snapshot.hasError) {
            return Text(
              'Hata: ${snapshot.error}',
              style: TextStyle(color: Colors.red),
            );
          }
        }
        return Text('Bir şeyler yanlış gitti.');
      },
    );
  }
}
