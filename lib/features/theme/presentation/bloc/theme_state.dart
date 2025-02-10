part of 'theme_bloc.dart';

/// Tema durumunu ifade eden sınıf
class ThemeState extends Equatable {
  final bool isDarkMode;

  const ThemeState({required this.isDarkMode});

  @override
  List<Object?> get props => [isDarkMode];
}
