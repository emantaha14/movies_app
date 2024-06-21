part of 'movie_details_cubit.dart';

@immutable
abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoadingState extends MovieDetailsState {}

class MovieDetailsLoadedState extends MovieDetailsState {
  final MovieDetails movieDetails;

  MovieDetailsLoadedState({required this.movieDetails});
}

class MovieDetailsErrorState extends MovieDetailsState {
  final String error;

  MovieDetailsErrorState({required this.error});
}
