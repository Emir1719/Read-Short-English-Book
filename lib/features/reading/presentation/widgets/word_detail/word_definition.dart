import 'package:english_will_fly/features/reading/util/color.dart';
import 'package:english_will_fly/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WordDefinition extends StatelessWidget {
  const WordDefinition({super.key, required this.value});
  final String? value;

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 8);
    final textTheme = Theme.of(context).textTheme;
    bool isDark = context.read<ThemeBloc>().state.isDarkMode;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Definition:",
            style: textTheme.bodyLarge?.copyWith(
              color: isDark ? AppColor.lightBlue : AppColor.storyCategoryTitle,
            ),
          ),
          space,
          Text(
            value?.trim() ?? "",
            style: textTheme.bodyMedium,
            textAlign: TextAlign.left,
            maxLines: 10,
          ),
        ],
      ),
    );
  }
}
