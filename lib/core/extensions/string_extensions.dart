import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:flutter/material.dart';

extension StringExtensions on String {
  toIcon(BuildContext context, {double size = 24}) {
    return ImageIcon(
      AssetImage(this),
      color: context.color.onSurface,
      size: size,
    );
  }
}
