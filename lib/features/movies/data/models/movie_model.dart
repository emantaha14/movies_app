import 'package:movies_app/features/movies/domain/entities/movie.dart';

class MovieResponse extends Movie {
  const MovieResponse(
      {required super.rank,
      required super.title,
      required super.description,
      required super.image,
      required super.bigImage,
      required super.genre,
      required super.thumbnail,
      required super.rating,
      required super.id,
      required super.year,
      required super.imdbid,
      required super.imdbLink});

  factory MovieResponse.fromJson(Map<String, dynamic> json) => MovieResponse(
      rank: json["rank"],
      title: json["title"],
      description: json["description"],
      image: json["image"],
      bigImage: json["big_image"],
      genre: List<String>.from(json["genre"].map((x) => x)),
      thumbnail: json["thumbnail"],
      rating: json["rating"],
      id: json["id"],
      year: json["year"],
      imdbid: json["imdbid"],
      imdbLink: json["imdb_link"],
  );

  Map<String, dynamic> toJson() => {
      "rank": rank,
      "title": title,
      "description": description,
      "image": image,
      "big_image": bigImage,
      "genre": List<dynamic>.from(genre.map((x) => x)),
      "thumbnail": thumbnail,
      "rating": rating,
      "id": id,
      "year": year,
      "imdbid": imdbid,
      "imdb_link": imdbLink,
  };
}
