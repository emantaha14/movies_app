import 'package:movies_app/features/movie_details/domain/entities/movie_details.dart';

class MovieDetailsResponse extends MovieDetails {
  MovieDetailsResponse(
      {required super.rank,
      required super.title,
      required super.thumbnail,
      required super.rating,
      required super.id,
      required super.year,
      required super.image,
      required super.bigImage,
      required super.description,
      required super.trailer,
      required super.trailerEmbedLink,
      required super.trailerYoutubeId,
      required super.genre,
      required super.director,
      required super.writers,
      required super.imdbid,
      required super.imdbLink});

  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) => MovieDetailsResponse(
      rank: json["rank"],
      title: json["title"],
      thumbnail: json["thumbnail"],
      rating: json["rating"],
      id: json["id"],
      year: json["year"],
      image: json["image"],
      bigImage: json["big_image"],
      description: json["description"],
      trailer: json["trailer"],
      trailerEmbedLink: json["trailer_embed_link"],
      trailerYoutubeId: json["trailer_youtube_id"],
      genre: List<String>.from(json["genre"].map((x) => x)),
      director: List<String>.from(json["director"].map((x) => x)),
      writers: List<String>.from(json["writers"].map((x) => x)),
      imdbid: json["imdbid"],
      imdbLink: json["imdb_link"],
  );

  Map<String, dynamic> toJson() => {
      "rank": rank,
      "title": title,
      "thumbnail": thumbnail,
      "rating": rating,
      "id": id,
      "year": year,
      "image": image,
      "big_image": bigImage,
      "description": description,
      "trailer": trailer,
      "trailer_embed_link": trailerEmbedLink,
      "trailer_youtube_id": trailerYoutubeId,
      "genre": List<dynamic>.from(genre.map((x) => x)),
      "director": List<dynamic>.from(director.map((x) => x)),
      "writers": List<dynamic>.from(writers.map((x) => x)),
      "imdbid": imdbid,
      "imdb_link": imdbLink,
  };
}
