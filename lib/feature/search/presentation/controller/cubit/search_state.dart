part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class LoadingSearchState extends SearchState {}

final class LoadedSearchState extends SearchState {}

final class ErrorSearchState extends SearchState {
  final String message;

  const ErrorSearchState({required this.message});
}
