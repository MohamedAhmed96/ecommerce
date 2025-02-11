import 'package:ecommerce/domain/repository/theme/base_theme_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeRepository extends BaseThemeRepository {
  static const String _themeKey = 'isDarkMode';

  @override
  Future<bool> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_themeKey) ?? false;
  }

  @override
  Future<void> setTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, isDark);
  }
}
