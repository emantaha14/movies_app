import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/theme_manager/color_manager.dart';
import 'package:movies_app/core/theme_manager/values_manager.dart';
import 'package:movies_app/features/movie_details/presentation/cubit/movie_details_cubit.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/favourite_icon_widget.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_trailer.dart';
import '../../../../core/theme_manager/strings_manager.dart';
import '../../../../injection_container.dart' as di;
import '../widgets/rate_bar_widget.dart';
import '../widgets/text_widget.dart';

class MovieDetailsPage extends StatelessWidget {
  final int rank;
  final String title;
  final String description;
  final String image;

  const MovieDetailsPage({
    super.key,
    required this.rank,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconColor = theme.brightness == Brightness.light ? ColorManager.black: ColorManager.white;
    return BlocProvider(
        create: (context) => di.sl<MovieDetailsCubit>()..getMovieDetails(rank),
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: iconColor),
            title:  Text(AppStrings.movieDetails),
            actions: [
              FavouriteIconWidget(
                description: description,
                image: image,
                title: title,
                movieId: rank,
              )
            ],
          ),
          body: BlocConsumer<MovieDetailsCubit, MovieDetailsState>(
            listener: (BuildContext context, Object? state) {},
            builder: (BuildContext context, state) {
              if (state is MovieDetailsLoadedState) {
                print(state.movieDetails.rating);
                return Padding(
                  padding: const EdgeInsets.only(top: AppPadding.p40, left: AppPadding.p8, right: AppPadding.p8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: MovieTrailerWidget(
                              link: state.movieDetails.trailerEmbedLink)),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: AppPadding.p40, left: AppPadding.p20, bottom: AppPadding.p15, right: AppPadding.p20),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: TextWidget(
                                  title: state.movieDetails.title,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 25,
                                ),
                              ),
                              Expanded(
                                child: RateBarWidget(
                                  rate: double.parse(state.movieDetails.rating),
                                ),
                              )
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: AppPadding.p20, bottom: AppPadding.p15),
                        child:
                            TextWidget(title: state.movieDetails.description),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: AppPadding.p20, top: AppPadding.p10),
                          child: TextWidget(
                            title: state.movieDetails.genre.toString(),
                          )),
                    ],
                  ),
                );
              } else if (state is MovieDetailsLoadingState) {
                return  Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.primary,
                  ),
                );
              } else if (state is MovieDetailsErrorState) {
                return Center(
                  child: Text(state.error),
                );
              }
              return Container();
            },
          ),
        ));
  }
}
