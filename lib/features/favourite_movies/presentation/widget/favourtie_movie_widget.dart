import 'package:flutter/material.dart';
import 'package:movies_app/features/movie_details/presentation/pages/movie_details_page.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/favourite_icon_widget.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/text_widget.dart';

import '../../../../core/theme_manager/color_manager.dart';
import '../../../../core/theme_manager/values_manager.dart';

class FavouriteMovieWidget extends StatelessWidget {
  final List favouriteMovies;
  final int index;

  const FavouriteMovieWidget({
    super.key,
    required this.favouriteMovies,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor =
        theme.brightness == Brightness.light ? ColorManager.black : ColorManager.white;
    final containerColor =
        theme.brightness == Brightness.light ? ColorManager.white : ColorManager.darkGrey;
    final shadow =
        theme.brightness == Brightness.light ? ColorManager.black54 : ColorManager.white;
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetailsPage(
                  rank: favouriteMovies[index]['movieId'],
                  title: favouriteMovies[index]['title'],
                  description: favouriteMovies[index]['description'],
                  image: favouriteMovies[index]['image'],
                ),
              ));
        },
        child: Container(
          height: 110,
          decoration: BoxDecoration(
            color: containerColor,
            boxShadow: [
              BoxShadow(
                color: shadow.withOpacity(0.4),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          TextWidget(
                            title: favouriteMovies[index]['title'],
                            fontSize: AppSize.s16,
                            fontWeight: FontWeight.w500,
                            color: textColor,
                          ),
                          FavouriteIconWidget(
                              movieId: favouriteMovies[index]['movieId']),
                        ],
                      ),
                      TextWidget(
                        title: favouriteMovies[index]['description'],
                        fontSize: AppSize.s14,
                        fontWeight: FontWeight.w400,
                        color: textColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    favouriteMovies[index]['image'],
                    width: AppSize.s75,
                    height: AppSize.s90,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
