import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error_handler/failures.dart';
import '../entities/movie.dart';
import '../repositories/movie_repo.dart';

class GetAllMoviesUseCase {
  final MovieRepository movieRepository;

  GetAllMoviesUseCase({required this.movieRepository});

  Future<Either<Failure, List<Movie>>> call() async {
    return await movieRepository.getAllMovies();
  }
}
