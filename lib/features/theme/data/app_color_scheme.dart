import 'package:flutter/material.dart';

/// Singleton deseni uygulanmış renk sınıfı
final class AppColorScheme {
  static final _instance = AppColorScheme._();
  AppColorScheme._();
  factory AppColorScheme() => _instance;

  static ColorScheme get light => ColorScheme.light(
        /// Ana renk
        primary: Colors.white,

        /// İkincil Ana Renk
        secondary: Colors.blue,

        /// Ana renk üzerindeki görünecek renk
        onPrimary: Colors.white,

        /// Sayfaların arka plan rengi
        surface: Colors.white,

        /// Metin rengi
        onSurface: Colors.black,

        /// Şeffaf arka plan rengi
        surfaceTint: Colors.transparent,

        /// Icon vb. rengi
        outline: Colors.blue,

        /// Gölge rengi
        shadow: Colors.grey,

        /// Container gibi widget'ların rengi
        primaryContainer: Colors.white,
        surfaceContainerLowest: Colors.grey.shade200,
        surfaceContainerLow: Colors.grey.shade300,
        surfaceContainerHigh: Colors.grey.shade700,
        surfaceContainerHighest: Colors.grey.shade800,

        /// Hata rengi
        error: Colors.red,

        tertiary: Colors.blue,

        brightness: Brightness.dark,
      );

  static ColorScheme get dark => ColorScheme.dark(
        /// Ana renk
        primary: Colors.grey.shade900,

        /// İkincil Ana Renk
        secondary: Colors.blue,

        /// Ana renk üzerindeki görünecek renk
        onPrimary: Colors.white,

        /// Sayfaların arka plan rengi
        surface: Colors.grey.shade800,

        /// Metin rengi
        onSurface: Colors.white,

        /// Şeffaf arka plan rengi
        surfaceTint: Colors.transparent,

        /// Icon vb. rengi
        outline: Colors.blueGrey.shade200,

        /// Gölge rengi
        shadow: Colors.black,

        /// Container gibi widget'ların rengi
        primaryContainer: const Color(0xff121212),
        surfaceContainerLowest: Colors.grey.shade900,
        surfaceContainerLow: Colors.grey.shade700,
        surfaceContainerHigh: Colors.grey.shade500,
        surfaceContainerHighest: Colors.grey.shade400,

        /// Hata rengi
        error: Colors.red.shade300,

        tertiary: const Color.fromARGB(255, 142, 219, 255),

        brightness: Brightness.light,
      );
}
