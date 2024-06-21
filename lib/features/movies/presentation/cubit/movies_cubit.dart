import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/features/movies/domain/usecases/get_all_posts_usecase.dart';
import '../../../../core/constants/constants.dart';
import '../../domain/entities/movie.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  GetAllMoviesUseCase getAllMoviesUseCase;

  MoviesCubit({required this.getAllMoviesUseCase}) : super(MoviesInitial());

  getAllMovies() async {
    emit(LoadingMoviesState());
    final moviesOrFailure = await getAllMoviesUseCase.call();
    moviesOrFailure.fold(
          (failure) =>
          emit(ErrorMoviesState(error: mapFailureToMessage(failure))),
          (movies) => emit(LoadedMoviesState(movies: movies)),
    );
  }

}

