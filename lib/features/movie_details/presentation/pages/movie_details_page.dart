import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movies_app/core/network/network_info.dart';
import 'package:movies_app/features/movie_details/data/repositories/movie_detials_repo_imp.dart';
import 'package:movies_app/features/movie_details/domain/usecases/movie_detials_usecase.dart';
import 'package:movies_app/features/movie_details/presentation/cubit/movie_details_cubit.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_trailer.dart';

import '../../data/datasources/movie_detail_remote_data_source.dart';

class MovieDetailsPage extends StatelessWidget {
  final int rank;
  MovieDetailsCubit movieDetailsCubit = MovieDetailsCubit(movieDetailsUseCase: MovieDetailsUseCase(
      movieDetailsRepository: MovieDetailsRepositoryImpl(
        networkInfo: NetworkInfoImpl(InternetConnectionChecker()),
        movieDetailRemoteDataSource: MovieDetailRemoteDataSourceImpl(),
      )));

  MovieDetailsPage({super.key, required this.rank});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Details'),
      ),
      body: Column(
        children: [
          // MovieTrailerWidget(),
        ],
      ),
    );
  }
}
