import 'package:ecommerce/domain/usecases/theme/get_theme_usecase.dart';
import 'package:ecommerce/domain/usecases/theme/set_theme_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final GetThemeUseCase getThemeUseCase;
  final SetThemeUseCase setThemeUseCase;

  ThemeBloc({required this.getThemeUseCase, required this.setThemeUseCase})
      : super(LightThemeState()) {
    on<ToggleThemeEvent>(_onToggleTheme);
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final isDark = await getThemeUseCase.execute();
    emit(isDark ? DarkThemeState() : LightThemeState());
  }

  Future<void> _onToggleTheme(
      ToggleThemeEvent event, Emitter<ThemeState> emit) async {
    final isDark = state is! DarkThemeState; // Toggle logic
    await setThemeUseCase.execute(isDark);
    emit(isDark ? DarkThemeState() : LightThemeState());
  }
}
