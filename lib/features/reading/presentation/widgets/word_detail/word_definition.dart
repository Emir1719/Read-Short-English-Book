import 'package:flutter/material.dart';

class WordDefinition extends StatelessWidget {
  const WordDefinition({super.key, required this.value});
  final String? value;

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 8);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Definition:",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.blue.shade900),
          ),
          space,
          Text(
            value?.trim() ?? "",
            style: const TextStyle(fontSize: 15),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
