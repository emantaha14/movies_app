import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../../core/network/network_info.dart';
import '../../data/datasources/movie_remote_data_source.dart';
import '../../data/repositories/movie_repo_imp.dart';
import '../../domain/usecases/get_all_posts_usecase.dart';
import '../cubit/movies_cubit.dart';

import '../widgets/movies_list_widget.dart';

class MoviesPage extends StatelessWidget {
   MoviesPage({super.key});
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (context) => MoviesCubit(
            getAllMoviesUseCase: GetAllMoviesUseCase(
                movieRepository: MovieRepositoryImpl(
                    remoteDataSource: MovieRemoteDataSourceImpl(),
                    networkInfo: NetworkInfoImpl(InternetConnectionChecker()))))
          ..getAllMovies(),
        child: BlocConsumer<MoviesCubit, MoviesState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is LoadedMoviesState) {
                print('success');
                return GetMoviesSlider(movies: state.movies,);
              } else if (state is LoadingMoviesState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ErrorMoviesState) {
                return Center(child: Text(state.error));
              }
              return Container();
            })
    );
  }
}

