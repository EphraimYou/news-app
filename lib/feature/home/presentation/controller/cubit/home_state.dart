part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class LoadingHomeState extends HomeState {}

final class ChangeButtonColorState extends HomeState {}

final class SuccessHomeState extends HomeState {}

final class ErrorHomeState extends HomeState {
  final String message;
  const ErrorHomeState({required this.message});
}
