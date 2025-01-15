import 'package:flutter/material.dart';

class HomeLevelImage extends StatelessWidget {
  const HomeLevelImage({super.key, required this.level});
  final String level;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 15),
      child: Image.asset(
        "assets/image/level/${level.toLowerCase()}.png",
        height: 80,
        fit: BoxFit.cover,
      ),
    );
  }
}
