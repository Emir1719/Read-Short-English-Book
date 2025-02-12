import 'package:flutter/material.dart';

class AppSize {
  static SliverGridDelegate gridDelegate(Orientation ori) {
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: ori == Orientation.portrait ? 2 : 4,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      childAspectRatio: 3 / 5.25,
    );
  }
}
