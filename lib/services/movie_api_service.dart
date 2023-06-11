import 'dart:convert';

import 'package:dartflutter/models/movie_model.dart';
import 'package:http/http.dart' as http;

import '../models/movie_detail_model.dart';

class MovieApiService {
  static const String baseUrl = 'https://movies-api.nomadcoders.workers.dev';
  static const String popular = 'popular';
  static const String nowPlaying = 'now-playing';
  static const String comingSoon = 'coming-soon';

  static Future<MovieModel> getMovies(String filter) async {
    late Uri url;
    switch (filter) {
      case popular:
        url = Uri.parse('$baseUrl/$popular');
      case nowPlaying:
        url = Uri.parse('$baseUrl/$nowPlaying');
      case comingSoon:
        url = Uri.parse('$baseUrl/$comingSoon');
      default:
        url = Uri.parse('$baseUrl/$popular');
    }

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movie = jsonDecode(response.body);
      return MovieModel.fromJson(movie);
    }
    throw Error();
  }

  static Future<MovieDetailModel> getMovieById(String id) async {
    final url = Uri.parse('$baseUrl/movie?id=$id');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final movie = jsonDecode(response.body);
      return MovieDetailModel.fromJson(movie);
    }
    throw Error();
  }
}
