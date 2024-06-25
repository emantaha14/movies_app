import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/theme_manager/color_manager.dart';
import 'package:movies_app/features/movie_details/presentation/pages/movie_details_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/theme_manager/values_manager.dart';
import '../../domain/entities/movie.dart';

class GetMoviesSlider extends StatefulWidget {
  final List<Movie> movies;

  const GetMoviesSlider({super.key, required this.movies});

  @override
  State<GetMoviesSlider> createState() => _GetMoviesSliderState();
}

class _GetMoviesSliderState extends State<GetMoviesSlider> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    print(' the numberrrr   ${widget.movies.length}');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider(
            items: widget.movies
                .map(
                  (movie) => SizedBox(
                    width: double.infinity,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MovieDetailsPage(rank: movie.rank,title: movie.title,image: movie.image,description: movie.description),
                            ));
                      },
                      child: Card(
                        elevation: 20,
                        shadowColor: ColorManager.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side:
                                 BorderSide(color: ColorManager.grey, width: 1)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(movie.image, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              height: AppSize.s400,
              autoPlay: false,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  if (index > 5) {
                    index = 5;
                  }
                  activeIndex = index;
                });
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: widget.movies.length < 6 ? widget.movies.length : 6,
            effect:  ExpandingDotsEffect(
              dotHeight: AppSize.s16,
              dotWidth: AppSize.s16,
              dotColor: ColorManager.grey,
              expansionFactor: 3.5,
              activeDotColor: ColorManager.primary,
            ),
            duration: const Duration(milliseconds: 400),
          ),
        ],
      ),
    );
  }
}
