import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  const AppError({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message.trim(),
        style: const TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.w500),
      ),
    );
  }
}
