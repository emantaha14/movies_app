import 'package:dartz/dartz.dart';

import 'package:movies_app/core/error_handler/failures.dart';

import 'package:movies_app/features/movies/domain/entities/movie.dart';

import '../../../../core/error_handler/error_exception.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/movie_repo.dart';
import '../datasources/movie_remote_data_source.dart';

class MovieRepositoryImpl implements MovieRepository{
  MovieRemoteDataSource remoteDataSource;
  NetworkInfo networkInfo;

  MovieRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, List<Movie>>> getAllMovies() async{
    if(await networkInfo.isConnected){
      try{
        final remoteMovies = await remoteDataSource.getAllMovies();
        return Right(remoteMovies);
      }
      on ServerException{
        return Left(ServerFailure());
      }
    }
    else{
      return Left(OfflineFailure());
    }
  }
}