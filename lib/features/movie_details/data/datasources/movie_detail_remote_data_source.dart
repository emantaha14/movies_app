import '../../../../core/error_handler/error_exception.dart';
import '../../../../core/networking/api_services.dart';
import '../../../movies/data/models/movie_model.dart';
import '../../domain/entities/movie_details.dart';
import '../models/movie_details_model.dart';

abstract class MovieDetailRemoteDataSource {
  Future<MovieDetails> getMovieDetails(int id);
}

class MovieDetailRemoteDataSourceImpl implements MovieDetailRemoteDataSource {
  @override
  Future<MovieDetails> getMovieDetails(int id) async {
    final baseUrl = 'https://imdb-top-100-movies.p.rapidapi.com/top$id';

    final response = await ApiServices.getData(urll: baseUrl);
    if (response.statusCode == 200) {
      print('yessssssssssssssss 200000000');
      print(response.data);
      final movieDetailsResponse = MovieDetailsResponse.fromJson(response.data);
      return movieDetailsResponse;
    } else {
      throw ServerException();
    }
  }
}
