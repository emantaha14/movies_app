class MovieDetails {
  final int rank;
  final String title;
  final String thumbnail;
  final String rating;
  final String id;
  final int year;
  final String image;
  final String bigImage;
  final String description;
  final String trailer;
  final String trailerEmbedLink;
  final String trailerYoutubeId;
  final List<String> genre;
  final List<String> director;
  final List<String> writers;
  final String imdbid;
  final String imdbLink;

  MovieDetails({
    required this.rank,
    required this.title,
    required this.thumbnail,
    required this.rating,
    required this.id,
    required this.year,
    required this.image,
    required this.bigImage,
    required this.description,
    required this.trailer,
    required this.trailerEmbedLink,
    required this.trailerYoutubeId,
    required this.genre,
    required this.director,
    required this.writers,
    required this.imdbid,
    required this.imdbLink,
  });

}