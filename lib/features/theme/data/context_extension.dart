import 'package:english_will_fly/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension ContextExtension on BuildContext {
  // theme
  TextTheme get text => Theme.of(this).textTheme;
  ColorScheme get color => Theme.of(this).colorScheme;

  // size
  Size get size => MediaQuery.of(this).size;
  double height([double scale = 1]) => size.height * scale;
  double width([double scale = 1]) => size.width * scale;

  // bloc
  get isDark => read<ThemeBloc>().state.isDarkMode;
}
