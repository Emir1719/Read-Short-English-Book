import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class AppDialog {
  // Singleton tasarım deseni
  AppDialog._();
  static final _instance = AppDialog._();
  factory AppDialog() => _instance;

  /// PlatformAlertDialog with two buttons
  static Future<void> show({
    required BuildContext context,
    void Function()? onSuccess,
    void Function()? onCancel,
    required String title,
    required String content,
    bool isPopAutomatic = true,
  }) async {
    var style = context.text.bodyMedium;

    await showPlatformDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return PlatformAlertDialog(
          title: Text(title),
          content: Text(content, maxLines: 5, softWrap: true),
          actions: [
            PlatformDialogAction(
              onPressed: () {
                onSuccess != null ? onSuccess() : null;
                // isPopAutomatic ? Navigator.pop(context) : null;
              },
              child: Text('Evet', style: style),
            ),
            PlatformDialogAction(
              onPressed: onCancel != null
                  ? () {
                      onCancel();
                      isPopAutomatic ? Navigator.pop(context) : null;
                    }
                  : () {
                      isPopAutomatic ? Navigator.pop(context) : null;
                    },
              child: Text('Hayır', style: style),
            ),
          ],
        );
      },
    );
  }

  static void snackbar({
    required BuildContext context,
    required String title,
    int seconds = 2,
  }) {
    final snackBar = SnackBar(
      duration: Duration(seconds: seconds),
      backgroundColor: context.color.secondary,
      content: Text(title, style: context.text.bodyMedium),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
