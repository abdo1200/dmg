part of 'home_cubit.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {
  HomeLoading();
}

class HomeLoaded extends HomeState {
  HomeLoaded();
}

class SearchLoading extends HomeState {
  SearchLoading();
}

class SearchLoaded extends HomeState {
  SearchLoaded();
}

class OtpStep extends HomeState {}

class LogOut extends HomeState {}

class LocationDisabled extends HomeState {}

class HomeError extends HomeState {
  final String message;
  HomeError({required this.message});
}
