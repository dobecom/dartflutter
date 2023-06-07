import 'package:flutter/material.dart';

class ThemeApp extends StatelessWidget {
  const ThemeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 동일한 위젯 내에서 테마를 적용 - 자식 위젯에게 적용할 때는 BuildContext context를 이용
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Colors.red),
        ),
      ),
      home: const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [MyLargeTitle()],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatelessWidget {
  const MyLargeTitle({
    super.key,
  });

// context가 위젯 트리의 정보를 가져올 수 있음
  @override
  Widget build(BuildContext context) {
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        // null safety 걸릴 때 조치 방법
        // titleLarge? - Null 일수도 있어
        // titleLarge! - 확실히 Null 아니야
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
