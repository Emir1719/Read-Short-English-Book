import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  const AppError({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message.trim(),
        maxLines: 10,
        style: const TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.w500),
      ).tr(),
    );
  }
}
