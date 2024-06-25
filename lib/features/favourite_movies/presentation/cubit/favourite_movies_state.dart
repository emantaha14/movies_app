part of 'favourite_movies_cubit.dart';

@immutable
abstract class FavouriteMoviesState {}

class FavouriteMoviesInitial extends FavouriteMoviesState {}

class GetDataSuccessState extends FavouriteMoviesState {
  final List<Map> favouriteMovies;

  GetDataSuccessState(this.favouriteMovies);
}

class LoadingState extends FavouriteMoviesState {}

class ErrorState extends FavouriteMoviesState {
  final String message;

  ErrorState(this.message);
}

class InsertDataSuccessState extends FavouriteMoviesState {}

class UpdateDataSuccessState extends FavouriteMoviesState {}

class DeleteDataSuccessState extends FavouriteMoviesState {}

class DeleteDataBaseSuccessState extends FavouriteMoviesState {}
