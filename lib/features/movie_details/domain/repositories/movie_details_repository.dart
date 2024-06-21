import 'package:dartz/dartz.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_details.dart';

import '../../../../core/error_handler/failures.dart';

abstract class MovieDetailsRepository{
  Future<Either<Failure, MovieDetails>>getMovieDetails(int id);
}