import 'package:english_will_fly/features/reading/util/color.dart';
import 'package:english_will_fly/features/theme/data/context_extension.dart';
import 'package:english_will_fly/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SnackbarTopPanel extends StatelessWidget {
  const SnackbarTopPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    bool isDark = context.read<ThemeBloc>().state.isDarkMode;
    Color? closeIconColor = isDark ? AppColor.lightBlue : AppColor.secondaryDark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Çeviri", style: context.text.bodyLarge),
        IconButton(
          onPressed: () => scaffoldMessenger.hideCurrentSnackBar(),
          icon: Icon(Icons.close_outlined, color: closeIconColor),
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }
}
