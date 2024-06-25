import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/theme_manager/color_manager.dart';
import 'package:movies_app/core/theme_manager/values_manager.dart';

import '../../../favourite_movies/presentation/cubit/favourite_movies_cubit.dart';

class FavouriteIconWidget extends StatelessWidget {
  final String ?title;
  final String ?image;
  final String ?description;
  final int movieId;

  const FavouriteIconWidget({
    super.key,
    this.title ,
    this.image ,
    this.description ,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconColor = theme.brightness == Brightness.light ? ColorManager.black : ColorManager.white;
    return Padding(
      padding:  const EdgeInsets.only(right: AppPadding.p10),
      child: BlocBuilder<FavouriteMoviesCubit, FavouriteMoviesState>(
        builder: (context, state) {
          if (state is GetDataSuccessState) {
            bool isFavourite = state.favouriteMovies.any((movie) => movie['movieId'] == movieId);
            return IconButton(
              icon: Icon(
                isFavourite ? Icons.favorite_rounded : Icons.favorite_outline_rounded,
              ),
              color: isFavourite ? ColorManager.red : iconColor,
              onPressed: () {
                if (isFavourite) {
                  context.read<FavouriteMoviesCubit>().removeData(movieId);
                } else {
                  context.read<FavouriteMoviesCubit>().insertData(title!, image!, description, movieId);
                }
                context.read<FavouriteMoviesCubit>().getData();
              },
            );
          } else if (state is LoadingState) {

            return const Center(child: CircularProgressIndicator());
          } else if (state is ErrorState) {
            return const Text('Error');
          }
          return Container();
        },
      ),
    );
  }
}
