import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int rank;
  final String title;
  final String description;
  final String image;
  final String bigImage;
  final List<String> genre;
  final String thumbnail;
  final String rating;
  final String id;
  final int year;
  final String imdbid;
  final String imdbLink;

  const Movie({
    required this.rank,
    required this.title,
    required this.description,
    required this.image,
    required this.bigImage,
    required this.genre,
    required this.thumbnail,
    required this.rating,
    required this.id,
    required this.year,
    required this.imdbid,
    required this.imdbLink,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [rank, title, description, image, bigImage, genre, thumbnail, rating, id, year, imdbid, imdbLink];

}
