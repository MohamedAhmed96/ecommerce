import 'package:ecommerce/domain/repository/theme/base_theme_repository.dart';

class SetThemeUseCase {
  final BaseThemeRepository repository;

  SetThemeUseCase(this.repository);

  Future<void> execute(bool isDark) {
    return repository.setTheme(isDark);
  }
}
