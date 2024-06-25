import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/features/movies/domain/usecases/get_all_posts_usecase.dart';
import '../../../../core/constants/constants.dart';
import '../../domain/entities/movie.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  GetAllMoviesUseCase getAllMoviesUseCase;

  MoviesCubit({required this.getAllMoviesUseCase}) : super(MoviesInitial());

  getAllMovies(String name) async {
    emit(LoadingMoviesState());
    final moviesOrFailure = await getAllMoviesUseCase.call();
    moviesOrFailure.fold(
        (failure) =>
            emit(ErrorMoviesState(error: mapFailureToMessage(failure))),
        (movies) {
      if (name.isEmpty) {
        print('Fetched Movies: ${movies.length}');
        emit(LoadedMoviesState(movies: movies));
      } else {
        final filteredList = movies
            .where((movie) => movie.title
                .toString()
                .toLowerCase()
                .contains(name.toLowerCase()))
            .toList();
        print('Filtered Movies: ${filteredList.length}');
        emit(LoadedMoviesState(movies: filteredList));
      }
    });
  }
}
