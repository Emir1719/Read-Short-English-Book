import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 60,
      backgroundColor: context.isDark ? Colors.grey.shade800 : Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          'assets/image/avatar/man1.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
