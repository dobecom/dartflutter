import 'dart:io';

import 'package:dartflutter/screens/movie_home.dart';
import 'package:flutter/material.dart';

class Player {
  final String name;
  Player({required this.name});
}

void main() {
  // 1. UI Challenge - My Wallet
  // var steve = Player(name: 'Steve');
  // runApp(StartApp(name: steve.name));

  // 2. Clone App - My Schedule
  // runApp(CloneApp());

  // 3. Stateful App - setState
  // runApp(const StateApp());

  // 4. Theme App
  // runApp(const ThemeApp());

  // 5. Init State App - Widget Life Cycle (Init - Build - Dispose)
  // runApp(const InitStateApp());

  // 6. Pomodoro App - Timer
  // runApp(const PomodoroApp());

  // 7. Pomodoro Custom App - Custom Timer
  // runApp(const PomodoroCustomApp());

  // 8. Webtoon App
  // API 호출 테스트
  // ApiService.getTodaysToons();

  // Image.network(webtoon.thumb) 호출 시 발생하는 에러 전역 처리 방법
  // HTTP request failed, statusCode: 403
  // HttpOverrides.global = MyHttpOverrides();
  // runApp(WebtoonHomeScreen());

  // 9. Movieflix
  runApp(MovieHomeScreen());

  // test
  // runApp(const TestApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..userAgent =
          'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36';
  }
}
