part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  final ThemeMode mode;
  const ThemeState(this.mode);

  @override
  List<Object> get props => [mode];
}

class ThemeLightState extends ThemeState {
  const ThemeLightState() : super(ThemeMode.light);
}

class ThemeDarkState extends ThemeState {
  const ThemeDarkState() : super(ThemeMode.dark);
}
