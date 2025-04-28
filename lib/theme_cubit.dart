import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

// Cubit class to manage theme state
class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(ThemeData.light()); // Default theme is light

  // Method to toggle the theme between light and dark
  void toggleTheme() {
    if (state == ThemeData.light()) {
      emit(ThemeData.dark());
    } else {
      emit(ThemeData.light());
    }
  }
}
