import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../core/constants/constants.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/usecases/movie_detials_usecase.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final MovieDetailsUseCase movieDetailsUseCase;

  MovieDetailsCubit({required this.movieDetailsUseCase})
      : super(MovieDetailsInitial());

  void getMovieDetails(int id) async {
    emit(MovieDetailsLoadingState());
    final moviesDetailsOrFailure = await movieDetailsUseCase.call(id);

    moviesDetailsOrFailure.fold(
        (failure) =>
            emit(MovieDetailsErrorState(error: mapFailureToMessage(failure))),
        (moviesDetails) =>
            MovieDetailsLoadedState(movieDetails: moviesDetails));
  }
}
