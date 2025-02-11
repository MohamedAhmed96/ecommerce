abstract class BaseThemeRepository {
  Future<bool> getTheme();
  Future<void> setTheme(bool isDark);
}
