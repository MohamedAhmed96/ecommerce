import 'package:ecommerce/domain/repository/theme/base_theme_repository.dart';

class GetThemeUseCase {
  final BaseThemeRepository repository;

  GetThemeUseCase(this.repository);

  Future<bool> execute() {
    return repository.getTheme();
  }
}
