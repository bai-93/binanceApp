part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ThemeChangeEvent extends ThemeEvent {
  final bool isDark;
  const ThemeChangeEvent(this.isDark);

  @override
  List<Object> get props => [isDark];
}
