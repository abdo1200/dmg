part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  final String? languageCode;
  final String? modeThem;
  final bool? isLogin;
  final Position? position;

  const AppState(
      {this.position, this.languageCode, this.modeThem, this.isLogin});

  @override
  List<Object> get props => [
        languageCode ?? LocaleConstants.defaultLocale,
        modeThem ?? "light",
        isLogin ?? false
      ];
}

class AppInitial extends AppState {
  const AppInitial() : super();
}

class ChangeSettings extends AppState {
  ChangeSettings(Position? pos)
      : super(
          position: pos,
        );
}
