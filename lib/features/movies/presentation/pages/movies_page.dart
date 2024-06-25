import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/theme_manager/values_manager.dart';
import '../../../../core/theme_manager/color_manager.dart';
import '../../../../core/theme_manager/strings_manager.dart';
import '../cubit/movies_cubit.dart';
import '../widgets/movies_list_widget.dart';
import '../widgets/search_bar_widget.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          labelText: AppStrings.searchLabel,
          onChanged: (String value) {
            context.read<MoviesCubit>().getAllMovies(value);
          },
        ),
        BlocConsumer<MoviesCubit, MoviesState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is LoadedMoviesState) {
              print('LoadedMoviesState with ${state.movies.length} movies');
              return GetMoviesSlider(
                movies: state.movies,
              );
            } else if (state is LoadingMoviesState) {
              print('LoadingMoviesState');
              return  Padding(
                padding: const EdgeInsets.only(top: AppPadding.p200),
                child: Center(
                    child: CircularProgressIndicator(
                  color: ColorManager.primary,
                )),
              );
            } else if (state is ErrorMoviesState) {
              print('ErrorMoviesState: ${state.error}');
              return Center(child: Text(state.error));
            }
            return Container();
          },
        ),
      ],
    );
  }
}
