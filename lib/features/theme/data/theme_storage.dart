import 'package:shared_preferences/shared_preferences.dart';

class ThemeStorage {
  static final _instance = ThemeStorage._();

  ThemeStorage._();

  factory ThemeStorage() => _instance;

  late SharedPreferences prefs;
  final String _themeModeKey = "themeModeKey";

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> setThemeMode(bool isDark) async {
    try {
      await prefs.setBool(_themeModeKey, isDark);
    } catch (e) {
      rethrow;
    }
  }

  bool getThemeMode() {
    try {
      return prefs.getBool(_themeModeKey) ?? false;
    } catch (e) {
      rethrow;
    }
  }
}
