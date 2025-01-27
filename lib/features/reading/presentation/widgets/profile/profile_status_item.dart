import 'package:flutter/material.dart';

class ProfileStatusItem extends StatelessWidget {
  const ProfileStatusItem({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        children: [
          Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(value, style: TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}
