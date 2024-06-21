import 'package:dartz/dartz.dart';
import 'package:movies_app/features/movie_details/domain/repositories/movie_details_repository.dart';

import '../../../../core/error_handler/failures.dart';
import '../entities/movie_details.dart';

class MovieDetailsUseCase {
  final MovieDetailsRepository movieDetailsRepository;

  MovieDetailsUseCase({required this.movieDetailsRepository});

  Future<Either<Failure, MovieDetails>> call(int id) async {
    return await movieDetailsRepository.getMovieDetails(id);
  }
}
