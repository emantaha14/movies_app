import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movies_app/features/movie_details/data/datasources/movie_detail_remote_data_source.dart';
import 'package:movies_app/features/movie_details/data/repositories/movie_detials_repo_imp.dart';
import 'package:movies_app/features/movie_details/domain/repositories/movie_details_repository.dart';
import 'package:movies_app/features/movie_details/domain/usecases/movie_detials_usecase.dart';
import 'package:movies_app/features/movie_details/presentation/cubit/movie_details_cubit.dart';
import 'package:movies_app/features/movies/data/datasources/movie_remote_data_source.dart';
import 'package:movies_app/features/movies/domain/usecases/get_all_posts_usecase.dart';
import 'package:movies_app/features/movies/presentation/cubit/movies_cubit.dart';

import 'core/network/network_info.dart';
import 'features/movies/data/repositories/movie_repo_imp.dart';
import 'features/movies/domain/repositories/movie_repo.dart';

final sl = GetIt.instance;

Future<void> init() async{
  sl.registerFactory(() => MoviesCubit(getAllMoviesUseCase: sl()));
  sl.registerLazySingleton(() => GetAllMoviesUseCase(movieRepository: sl()));
  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()));
  sl.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());

  sl.registerFactory(() => MovieDetailsCubit(movieDetailsUseCase: sl()));
  sl.registerLazySingleton(() => MovieDetailsUseCase(movieDetailsRepository: sl()));
  sl.registerLazySingleton<MovieDetailRemoteDataSource>(() => MovieDetailRemoteDataSourceImpl());
  sl.registerLazySingleton<MovieDetailsRepository>(() => MovieDetailsRepositoryImpl(networkInfo: sl(), movieDetailRemoteDataSource: sl()));

}