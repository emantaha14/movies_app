import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/theme_manager/values_manager.dart';
import 'package:movies_app/features/favourite_movies/presentation/widget/favourtie_movie_widget.dart';
import '../cubit/favourite_movies_cubit.dart';

class FavouriteMoviesPage extends StatelessWidget {
  const FavouriteMoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: BlocConsumer<FavouriteMoviesCubit, FavouriteMoviesState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GetDataSuccessState) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return FavouriteMovieWidget(
                      favouriteMovies: state.favouriteMovies, index: index,);
                },
                itemCount: state.favouriteMovies.length,
              );
            } else if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ErrorState) {
              return  Center(
                child: Text(state.message),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
