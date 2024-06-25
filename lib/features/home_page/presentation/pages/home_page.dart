import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/constants.dart';
import 'package:movies_app/core/theme_manager/color_manager.dart';
import 'package:movies_app/features/favourite_movies/presentation/pages/favourite_movies_page.dart';
import 'package:movies_app/features/movies/presentation/pages/movies_page.dart';
import 'package:movies_app/features/profile/presentation/profile_page.dart';

import '../../../../core/theme_manager/strings_manager.dart';
import '../../../../core/theme_manager/values_manager.dart';

class HomePage extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const HomePage({
    super.key,
    required this.toggleTheme,
    required this.isDarkMode,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int myCurrentIndex = 0;

  final List<Widget> pages = [
    const MoviesPage(),
    const FavouriteMoviesPage(),
    const ProfilePage(),
  ];
  final List titles = [AppStrings.moviesApp, AppStrings.favouriteMovies, AppStrings.profile];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          titles[myCurrentIndex],
        ),
        actions: [
          IconButton(
            onPressed: widget.toggleTheme,
            icon: Icon(
              widget.isDarkMode ? Icons.brightness_7 : Icons.brightness_4_outlined,
              color: widget.isDarkMode ? ColorManager.white : ColorManager.black,
            ),
          ),
        ],
      ),
      body: pages[myCurrentIndex],
      bottomNavigationBar: Container(
        height: AppSize.s80,
        margin:  const EdgeInsets.symmetric(horizontal: AppPadding.p20, vertical: AppPadding.p20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: isDark? ColorManager.white.withOpacity(0.2) : ColorManager.black54.withOpacity(0.2),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: isDark? ColorManager.black12:ColorManager.white,
            ),
            child: BottomNavigationBar(
              currentIndex: myCurrentIndex,
              onTap: (index) {
                setState(() {
                  myCurrentIndex = index;
                });
              },
              items:  [
                BottomNavigationBarItem(icon: const Icon(Icons.home), label: AppStrings.home),
                BottomNavigationBarItem(icon: const Icon(Icons.favorite), label: AppStrings.favourite),
                BottomNavigationBarItem(icon: const Icon(Icons.person_outline), label: AppStrings.profile),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
