
import 'package:movies_app/features/movies/data/models/movie_model.dart';

import '../../../../core/error_handler/error_exception.dart';
import '../../../../core/networking/api_services.dart';
import '../../domain/entities/movie.dart';

abstract class MovieRemoteDataSource {
  Future<List<Movie>> getAllMovies();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {

  @override
  Future<List<Movie>> getAllMovies() async {
    const baseUrl = 'https://imdb-top-100-movies.p.rapidapi.com/';

    final response = await ApiServices.getData(urll: baseUrl);
    if (response.statusCode == 200) {
      print('200000000');
      print(response.data);
      final List jsonOfMovies = response.data as List;
      final List<MovieResponse> movieResponses = jsonOfMovies
          .map((jsonMovieResponse) => MovieResponse.fromJson(jsonMovieResponse))
          .toList();
      return movieResponses;
    } else {
      throw ServerException();
    }
  }
}
