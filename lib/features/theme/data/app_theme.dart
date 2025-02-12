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
      listTileTheme: _listTileTheme(),
      dividerTheme: _dividerTheme(),
    );
  }

  DividerThemeData _dividerTheme() {
    return DividerThemeData(color: _colorScheme.surfaceContainerLow);
  }

  ListTileThemeData _listTileTheme() {
    return ListTileThemeData(
      titleTextStyle: _textTheme.bodyMedium,
      subtitleTextStyle: _textTheme.bodySmall,
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
      overlayColor: WidgetStatePropertyAll(_colorScheme.secondary),
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
        fixedSize: const Size.fromHeight(55),
        backgroundColor: _colorScheme.secondary,
        foregroundColor: _colorScheme.primary,
        surfaceTintColor: _colorScheme.secondary,
        shadowColor: _colorScheme.secondary,
        side: BorderSide(width: 0, color: _colorScheme.secondary),
        textStyle: _textTheme.bodyMedium?.copyWith(color: _colorScheme.onPrimary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }

  TextButtonThemeData _textButtonThemeData() {
    return TextButtonThemeData(
      style: ButtonStyle(
        fixedSize: WidgetStatePropertyAll(const Size.fromHeight(55)),
        textStyle: WidgetStatePropertyAll(_textTheme.bodyMedium),
        surfaceTintColor: WidgetStateProperty.resolveWith((states) {
          return _colorScheme.onPrimary;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          return _colorScheme.secondary;
        }),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return _colorScheme.surfaceContainerLow;
          }
          return _colorScheme.surfaceTint;
        }),
      ),
    );
  }

  TextSelectionThemeData _textSelectionTheme() {
    return TextSelectionThemeData(
      cursorColor: _colorScheme.onSurface,
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
      elevation: 0,
      actionsIconTheme: IconThemeData(color: _colorScheme.onSurface),
      iconTheme: IconThemeData(color: _colorScheme.onSurface, size: 24),
      color: _colorScheme.primary,
      surfaceTintColor: _colorScheme.surfaceTint,
      titleTextStyle: _textTheme.titleMedium?.copyWith(
        color: _colorScheme.onSurface,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: _colorScheme.primary,
        statusBarIconBrightness: _colorScheme.brightness,
        statusBarBrightness: _colorScheme.brightness,
        systemNavigationBarColor: _colorScheme.surface,
        systemNavigationBarIconBrightness: _colorScheme.brightness,
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
    final border = UnderlineInputBorder(borderSide: BorderSide(color: _colorScheme.secondary));

    return InputDecorationTheme(
      labelStyle: _textTheme.bodyMedium,
      hintStyle: _textTheme.bodyMedium,
      outlineBorder: BorderSide.none,
      border: border,
      disabledBorder: border,
      focusedBorder: border,
      enabledBorder: border,
      iconColor: _colorScheme.onSurface,
      prefixIconColor: _colorScheme.onSurface,
      suffixIconColor: _colorScheme.onSurface,
      errorBorder: border.copyWith(borderSide: BorderSide(color: _colorScheme.error)),
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
