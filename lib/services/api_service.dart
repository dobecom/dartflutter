import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/webtoon_detail_model.dart';
import '../models/webtoon_episode_model.dart';
import '../models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      'https://webtoon-crawler.nomadcoders.workers.dev';
  static const String today = 'today';

  static Future<List<WebtoonModel>> getTodaysToons() async {
    final url = Uri.parse('$baseUrl/$today');
    final res = await http.get(url);

    List<WebtoonModel> webtoonInstances = [];

    if (res.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(res.body);
      for (var webtoon in webtoons) {
        final toon = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(toon);
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final toon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(toon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getEpisodeById(String id) async {
    final url = Uri.parse('$baseUrl/$id/episode');
    final response = await http.get(url);
    List<WebtoonEpisodeModel> webtoonInstances = [];
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var epi in episodes) {
        webtoonInstances.add(epi);
      }
      return episodes;
    }
    throw Error();
  }
}
