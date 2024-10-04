import 'package:flutter/material.dart';

class WordExample extends StatelessWidget {
  const WordExample({super.key, this.value});
  final String? value;

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 8);

    if (value == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Example:",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.red,
            ),
          ),
          space,
          Text(value ?? "", style: const TextStyle(fontSize: 15)),
        ],
      ),
    );
  }
}
