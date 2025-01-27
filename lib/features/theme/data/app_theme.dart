import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Bu tema sınıfında renk değiştirmek için
/// yalnızca [_colorScheme] değerini değiştirmek yeterli.
final class AppThemeNew {
  final ColorScheme _colorScheme;
  late TextTheme _textTheme;

  AppThemeNew(this._colorScheme) {
    _textTheme = _textThemeFunc();
  }

  ThemeData theme() {
    return ThemeData(
      textTheme: _textTheme,
      colorScheme: _colorScheme,
      scaffoldBackgroundColor: _colorScheme.surface,
      drawerTheme: _drawerTheme(),
      appBarTheme: _appBarTheme(),
      inputDecorationTheme: _inputDecorationTheme(),
      popupMenuTheme: _popupMenuTheme(),
      dialogTheme: _dialogTheme(),
      bottomSheetTheme: _bottomSheetTheme(),
      textSelectionTheme: _textSelectionTheme(),
      textButtonTheme: _textButtonThemeData(),
      elevatedButtonTheme: _elevatedButtonTheme(),
      iconButtonTheme: _iconButtonTheme(),
      bottomNavigationBarTheme: _bottomNavigationBarThemeData(),
      switchTheme: _switchThemeData(),
      snackBarTheme: _snackBarTheme(),
    );
  }

  SnackBarThemeData _snackBarTheme() {
    return SnackBarThemeData(
      backgroundColor: _colorScheme.primary,
    );
  }

  BottomSheetThemeData _bottomSheetTheme() {
    return BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      backgroundColor: _colorScheme.surface,
    );
  }

  SwitchThemeData _switchThemeData() {
    return SwitchThemeData(
      trackColor: WidgetStatePropertyAll(_colorScheme.primary),
      thumbColor: WidgetStatePropertyAll(_colorScheme.onSurface),
      overlayColor: WidgetStatePropertyAll(_colorScheme.surface),
      trackOutlineColor: WidgetStatePropertyAll(_colorScheme.onSurface),
    );
  }

  BottomNavigationBarThemeData _bottomNavigationBarThemeData() {
    return BottomNavigationBarThemeData(
      backgroundColor: _colorScheme.surface,
      selectedItemColor: _colorScheme.onSurface,
      unselectedItemColor: _colorScheme.surfaceContainerHigh,
    );
  }

  IconButtonThemeData _iconButtonTheme() {
    return IconButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStatePropertyAll(_colorScheme.onSurface),
        backgroundColor: WidgetStatePropertyAll(_colorScheme.surfaceTint),
        foregroundColor: WidgetStatePropertyAll(_colorScheme.onPrimary),
        surfaceTintColor: WidgetStatePropertyAll(_colorScheme.surfaceTint),
      ),
    );
  }

  ElevatedButtonThemeData _elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size.fromHeight(50),
        backgroundColor: _colorScheme.surfaceTint,
        foregroundColor: _colorScheme.primary,
        surfaceTintColor: _colorScheme.surfaceTint,
        shadowColor: _colorScheme.surfaceTint,
        side: BorderSide(width: 1, color: _colorScheme.primary),
        textStyle: _textTheme.bodyMedium?.copyWith(color: _colorScheme.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  TextButtonThemeData _textButtonThemeData() {
    return TextButtonThemeData(
      style: ButtonStyle(
        fixedSize: WidgetStatePropertyAll(const Size.fromHeight(50)),
        textStyle: WidgetStatePropertyAll(_textTheme.bodyMedium),
        surfaceTintColor: WidgetStateProperty.resolveWith((states) {
          return _colorScheme.onPrimary;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          return _colorScheme.primary;
        }),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return _colorScheme.primaryContainer;
          }
          return _colorScheme.surfaceTint;
        }),
      ),
    );
  }

  TextSelectionThemeData _textSelectionTheme() {
    return TextSelectionThemeData(
      cursorColor: _colorScheme.primary,
      selectionColor: _colorScheme.primary,
      selectionHandleColor: _colorScheme.primary,
    );
  }

  DialogTheme _dialogTheme() {
    return DialogTheme(
      backgroundColor: _colorScheme.surface,
      surfaceTintColor: _colorScheme.surfaceTint,
      titleTextStyle: _textTheme.titleMedium,
      contentTextStyle: _textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.normal,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
    );
  }

  PopupMenuThemeData _popupMenuTheme() {
    return PopupMenuThemeData(
      color: _colorScheme.surface,
    );
  }

  AppBarTheme _appBarTheme() {
    return AppBarTheme(
      centerTitle: true,
      elevation: 5,
      actionsIconTheme: IconThemeData(color: _colorScheme.onSurface),
      iconTheme: IconThemeData(color: _colorScheme.onSurface, size: 24),
      color: _colorScheme.primary,
      surfaceTintColor: _colorScheme.surfaceTint,
      titleTextStyle: _textTheme.titleMedium?.copyWith(
        color: _colorScheme.onSurface,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: _colorScheme.onSurface,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: _colorScheme.onSurface,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  DrawerThemeData _drawerTheme() {
    return DrawerThemeData(
      backgroundColor: _colorScheme.surface,
      surfaceTintColor: _colorScheme.surface,
    );
  }

  InputDecorationTheme _inputDecorationTheme() {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: _colorScheme.onSurface),
    );

    return InputDecorationTheme(
      labelStyle: _textTheme.bodyMedium,
      hintStyle: _textTheme.bodyMedium,
      outlineBorder: BorderSide.none,
      border: border,
      disabledBorder: border,
      focusedBorder: border.copyWith(borderSide: BorderSide(color: _colorScheme.primary)),
      enabledBorder: border,
      errorBorder: border.copyWith(borderSide: BorderSide(color: _colorScheme.error)),
      contentPadding: EdgeInsets.only(top: 16, left: 15, right: 15, bottom: 16),
    );
  }

  TextTheme _textThemeFunc() {
    final base = TextStyle(
      fontSize: 16,
      overflow: TextOverflow.visible,
      color: _colorScheme.onSurface,
      fontWeight: FontWeight.normal,
    );

    return TextTheme(
      // Ana metin
      bodyLarge: base.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
      bodyMedium: base,
      bodySmall: base.copyWith(fontSize: 14),

      // Başlıklar
      titleLarge: base.copyWith(fontSize: 22, fontWeight: FontWeight.w500),
      titleMedium: base.copyWith(fontSize: 20, fontWeight: FontWeight.w500),
    );
  }
}
