part of 'movies_cubit.dart';

@immutable
abstract class MoviesState {}

class MoviesInitial extends MoviesState {}

class LoadingMoviesState extends MoviesState{}

class LoadedMoviesState extends MoviesState{
  final List<Movie> movies;
  LoadedMoviesState({required this.movies});
}

class ErrorMoviesState extends MoviesState{
  final String error;
  ErrorMoviesState({required this.error});
}