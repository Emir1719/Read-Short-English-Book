import 'package:english_will_fly/features/reading/util/color.dart';
import 'package:english_will_fly/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WordExample extends StatelessWidget {
  const WordExample({super.key, this.value});
  final String? value;

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 8);

    if (value == null) {
      return const SizedBox.shrink();
    }

    final textTheme = Theme.of(context).textTheme;
    bool isDark = context.read<ThemeBloc>().state.isDarkMode;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Example:",
            style: textTheme.bodyLarge?.copyWith(
              color: isDark ? AppColor.exampleDark : AppColor.example,
            ),
          ),
          space,
          Text(
            value ?? "",
            style: textTheme.bodyMedium,
            maxLines: 10,
          ),
        ],
      ),
    );
  }
}
