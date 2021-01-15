class MovieModel {
  final int id;
  final double popularity;
  final String title;
  final String backPoster;
  final String poster;
  final String overview;
  final double rating;

  MovieModel(
      {this.id,
      this.popularity,
      this.title,
      this.backPoster,
      this.poster,
      this.overview,
      this.rating});

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json["id"],
        popularity: json["popularity"],
        title: json["title"],
        backPoster: json["backdrop_path"],
        poster: json["poster_path"],
        overview: json["overview"],
        rating: json["vote_average"].toDouble(),
      );
}
