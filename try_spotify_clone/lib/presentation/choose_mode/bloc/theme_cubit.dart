import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void updateTheme(ThemeMode themeMode) => emit(themeMode);

  @override
  fromJson(Map<String, dynamic> json) {
    final themeIndex = json['themeIndex'] as int;
    if (themeIndex >= 0 && themeIndex < ThemeMode.values.length) {
      return ThemeMode.values[themeIndex];
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(state) {
    return {'themeIndex': state.index};
  }
}
