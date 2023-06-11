class MovieModel {
  final List<dynamic> results;

  MovieModel.fromJson(Map<String, dynamic> json) : results = json['results'];
}
