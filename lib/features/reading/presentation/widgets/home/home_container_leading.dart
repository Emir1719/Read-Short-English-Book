import 'package:flutter/material.dart';

class HomeContainerLeading extends StatelessWidget {
  const HomeContainerLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      child: Icon(Icons.book, color: Colors.white),
    );
  }
}
