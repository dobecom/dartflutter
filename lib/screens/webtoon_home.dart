import 'package:dartflutter/models/webtoon_model.dart';
import 'package:dartflutter/widgets/webtoon_widget.dart';
import 'package:flutter/material.dart';

import '../services/api_service.dart';

class WebtoonHomeScreen extends StatelessWidget {
  WebtoonHomeScreen({super.key});
  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          foregroundColor: Colors.green,
          backgroundColor: Colors.white,
          elevation: 1,
          title: const Text(
            '오늘의 웹툰',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        // Stateful widget으로 setState를 하지 않고도
        // FutureBuilder를 통해 값을 기다릴 데이터를 넘겨주면 동일하게 처리 가능
        body: FutureBuilder(
          future: webtoons,
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  // const SizedBox(height: 20),
                  // Column안에 ListView를 사용하기 위해 Expanded로 감싸줌
                  Expanded(child: makeList(snapshot)),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    // ListView.builder가 아닌 separated를 사용하면
    // 데이터 들어오는 항목마다 구분을 넣을 수 있도록 관리를 해줌
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      itemBuilder: (ctx, idx) {
        var webtoon = snapshot.data![idx];

        return Webtoon(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
        );
      },
      // ListView의 아이템들을 나열할 때, Padding을 쓰지 않고 구분을 할 수 있도록 해줌
      separatorBuilder: (ctx, idx) {
        return const SizedBox(
          width: 40,
        );
      },
    );
  }
}
