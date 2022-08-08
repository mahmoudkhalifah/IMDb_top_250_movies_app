part of 'movies_cubit.dart';

@immutable
abstract class MoviesState {}

class MoviesInitial extends MoviesState {}

class MoviesLoaded extends MoviesState {
  final List<Movie> movies;

  MoviesLoaded({required this.movies});
}

class MoviesLoadError extends MoviesState {
  final String errorMsg;

  MoviesLoadError({required this.errorMsg});

}