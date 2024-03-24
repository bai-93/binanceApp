import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sheker/config/theme/theme_manager.dart';
import 'package:sheker/injection/injection_configure.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeManager _manager = getIt<ThemeManager>();

  ThemeBloc() : super(const ThemeLightState()) {
    on<ThemeEvent>((event, emit) {
      if (event is ThemeChangeEvent) {
        _manager.changeThemeMode(event.isDark);
        if (event.isDark) {
          emit(const ThemeDarkState());
        } else {
          emit(const ThemeLightState());
        }
      }
    });
  }
}
