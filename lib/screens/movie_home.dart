import 'package:dartflutter/services/movie_api_service.dart';
import 'package:flutter/material.dart';

import '../models/movie_model.dart';
import 'movie_detail.dart';

// TODO: Image 입히기 (Notes 미확인)
// 영화 데이터베이스에서 이미지를 표시할 때는 https://image.tmdb.org/t/p/w500/ + 이미지 경로와 같은 URL을 사용해야 합니다.
// 예를 들어 이미지 경로가 "/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg"인 경우 전체 URL은 https://image.tmdb.org/t/p/w500/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg 입니다.
class MovieHomeScreen extends StatelessWidget {
  MovieHomeScreen({super.key});
  late Future<MovieModel> popularMovie = MovieApiService.getMovies('popular');
  late Future<MovieModel> nowPlayingMovie =
      MovieApiService.getMovies('now-playing');
  late Future<MovieModel> comingSoonMovie =
      MovieApiService.getMovies('coming-soon');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                'Popular Movies',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              Movies(movie: popularMovie, color: Colors.blue),
              const SizedBox(
                height: 100,
              ),
              const Text(
                'Now in Cinemas',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              Movies(
                movie: nowPlayingMovie,
                color: Colors.red,
              ),
              const SizedBox(
                height: 100,
              ),
              const Text(
                'Coming Soon',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              Movies(
                movie: nowPlayingMovie,
                color: Colors.yellow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Movies extends StatelessWidget {
  const Movies({super.key, required this.movie, required this.color});

  final Future<MovieModel> movie;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: movie,
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var item in snapshot.data!.results)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                        width: 100,
                        decoration: BoxDecoration(color: color),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => MovieDetailScreen(
                                  id: item['id'].toString(),
                                  title: item['title'],
                                ),
                              ),
                            );
                          },
                          child: Text(
                            item['title'],
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        )),
                  )
              ],
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
