import 'package:dartflutter/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/webtoon_detail_model.dart';
import '../models/webtoon_episode_model.dart';
import '../widgets/episode.dart';

// DetailScreen에서 받아올 데이터는 부모 위젯으로부터 전달받은 id를 API로 요청 보내야 하는데
// 이 경우는 StatefulWidget으로 전환하여 사용해야 함 (initState)
class WebtoonDetailScreen extends StatefulWidget {
  final String id, title, thumb;
  const WebtoonDetailScreen(
      {super.key, required this.id, required this.title, required this.thumb});

  @override
  State<WebtoonDetailScreen> createState() => _WebtoonDetailScreenState();
}

class _WebtoonDetailScreenState extends State<WebtoonDetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;
  late SharedPreferences prefs;
  bool isLiked = false;

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final likedToons = prefs.getStringList('likedToons');
    if (likedToons != null) {
      if (likedToons.contains(widget.id) == true) {
        setState(() {
          isLiked = true;
        });
      }
    } else {
      await prefs.setStringList('likedToons', []);
    }
  }

  final bool isFavorite = false;

  onHeartTap() async {
    final likedToons = prefs.getStringList('likedToons');
    if (likedToons != null) {
      if (isLiked) {
        likedToons.remove(widget.id);
      } else {
        likedToons.add(widget.id);
      }
      await prefs.setStringList('likedToons', likedToons);
      setState(() {
        isLiked = !isLiked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getEpisodeById(widget.id);
    initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    // final detail = ApiService.getToonById(id);
    // print(detail);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          foregroundColor: Colors.green,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: onHeartTap,
              icon: isLiked
                  ? const Icon(
                      Icons.favorite_rounded,
                    )
                  : const Icon(
                      Icons.favorite_outline_rounded,
                    ),
            ),
          ],
          elevation: 1,
          title: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        // Stateful widget으로 setState를 하지 않고도
        // FutureBuilder를 통해 값을 기다릴 데이터를 넘겨주면 동일하게 처리 가능
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                Center(
                  child: Hero(
                    // Stateless 부모로부터 전달받은 파라미터를 Stateful 자식에서 사용하기 위해서는
                    // widget.xx 형태로 사용해야 함
                    tag: widget.id,
                    child: Container(
                      width: 200,
                      // 자식의 부모 영역 침범을 제어하는 방법
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 15,
                              offset: const Offset(10, 15),
                              // 그림자 생성
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ]),
                      child: SizedBox(
                        width: 200,
                        child: Image.network(
                          widget.thumb,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                FutureBuilder(
                  future: webtoon,
                  builder: (ctx, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data!.about,
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${snapshot.data!.genre} / ${snapshot.data!.age}',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      );
                    }
                    return const Text('...');
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                FutureBuilder(
                  future: episodes,
                  builder: (ctx, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var episode in snapshot.data!)
                            Episode(episode: episode, webtoonId: widget.id)
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
