import 'package:flutter/material.dart';

import '../models/movie_detail_model.dart';
import '../services/movie_api_service.dart';

// DetailScreen에서 받아올 데이터는 부모 위젯으로부터 전달받은 id를 API로 요청 보내야 하는데
// 이 경우는 StatefulWidget으로 전환하여 사용해야 함 (initState)
class MovieDetailScreen extends StatefulWidget {
  final String id, title;
  const MovieDetailScreen({super.key, required this.id, required this.title});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

// TODO: Image 입히기 (Notes 미확인)
class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late Future<MovieDetailModel> movie;

  @override
  void initState() {
    super.initState();
    movie = MovieApiService.getMovieById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          title: const Text(
            'Back to list',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        // Stateful widget으로 setState를 하지 않고도
        // FutureBuilder를 통해 값을 기다릴 데이터를 넘겨주면 동일하게 처리 가능
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.w600),
                ),
                FutureBuilder(
                  future: movie,
                  builder: (ctx, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ratings : ${snapshot.data!.voteAverage.toString()}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Text(
                                  '${(snapshot.data!.runtime / 60).floor().toString()}h ${(snapshot.data!.runtime % 60).toString()}min | ',
                                  style: const TextStyle(fontSize: 18),
                                ),
                                for (var item in snapshot.data!.genres)
                                  Text(
                                    '${item['name']},',
                                    style: const TextStyle(fontSize: 18),
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'Storyline',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            snapshot.data!.overview,
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'Poster path',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            snapshot.data!.posterPath,
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: Container(
                                alignment: Alignment.center,
                                width: 300,
                                decoration: const BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: const Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                    'Buy ticket',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )),
                          )
                        ],
                      );
                    }
                    return const Text('...');
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
