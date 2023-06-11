import 'package:flutter/material.dart';

import '../screens/webtoon_detail.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon(
      {super.key, required this.title, required this.thumb, required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (ctx) => WebtoonDetailScreen(
                    id: id,
                    title: title,
                    thumb: thumb,
                  ),
              // MPR의 옵션으로 fullscreenDialog를 줄 경우 페이지 슬라이드 방식으로 넘어가는 것이 아니라
              // 새로운 팝업이 띄워지는 것처럼 나타나게됨 (돌아가기 아이콘도 <-가 아닌 X로 나타남)
              fullscreenDialog: true),
        );
      },
      child: Column(
        children: [
          // 위젯간 이동할 때 애니메이션 효과를 주기 위해 Hero 위젯 사용
          Hero(
            tag: id,
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
                  thumb,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 22),
          ),
        ],
      ),
    );
  }
}
