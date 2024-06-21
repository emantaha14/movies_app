import 'package:dartz/dartz.dart';

import '../../../../core/error_handler/failures.dart';
import '../entities/movie.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getAllMovies();
}