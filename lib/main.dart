import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/networking/api_services.dart';
import 'package:movies_app/features/favourite_movies/presentation/cubit/favourite_movies_cubit.dart';
import 'package:movies_app/features/home_page/presentation/pages/home_page.dart';
import 'core/constants/constants.dart';
import 'core/theme_manager/theme_manager.dart';
import 'features/movies/presentation/cubit/movies_cubit.dart';
import 'injection_container.dart' as di;

void main() {
  di.init();
  ApiServices.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;
  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
      isDark = !isDark;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<MoviesCubit>()..getAllMovies(''),
        ),
        BlocProvider(
          create: (context) => FavouriteMoviesCubit()
            ..initSql()
            ..getData(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: getLightMode(),
        darkTheme: getDarkMode(),
        themeMode: _themeMode,
        debugShowCheckedModeBanner: false,
        home: HomePage(toggleTheme: _toggleTheme, isDarkMode: _themeMode == ThemeMode.dark),
      ),
    );
  }
}
