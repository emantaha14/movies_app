import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error_handler/error_exception.dart';
import 'package:movies_app/core/error_handler/failures.dart';
import 'package:movies_app/core/network/network_info.dart';
import 'package:movies_app/features/movie_details/data/datasources/movie_detail_remote_data_source.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_details.dart';
import 'package:movies_app/features/movie_details/domain/repositories/movie_details_repository.dart';

class MovieDetailsRepositoryImpl implements MovieDetailsRepository {
  final MovieDetailRemoteDataSource movieDetailRemoteDataSource;
  final NetworkInfo networkInfo;

  MovieDetailsRepositoryImpl(
      {required this.networkInfo, required this.movieDetailRemoteDataSource});

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(int id) async {
    if(await networkInfo.isConnected){
      try{
        final movieDetails = await movieDetailRemoteDataSource.getMovieDetails(id);
        return right(movieDetails);
      }
      on ServerException{
        return left(ServerFailure());
      }

    }
    else{
      return left(OfflineFailure());
    }
  }
}
