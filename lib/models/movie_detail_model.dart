class MovieDetailModel {
  final String posterPath, overview;
  final double voteAverage;
  final List<dynamic> genres;
  final int runtime;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : posterPath = json['poster_path'],
        voteAverage = json['vote_average'],
        overview = json['overview'],
        genres = json['genres'],
        runtime = json['runtime'];
}
