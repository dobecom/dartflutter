import 'package:flutter/material.dart';

class InitStateApp extends StatefulWidget {
  const InitStateApp({super.key});

  @override
  State<InitStateApp> createState() => _InitStateAppState();
}

class _InitStateAppState extends State<InitStateApp> {
  bool showTitle = false;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 동일한 위젯 내에서 테마를 적용 - 자식 위젯에게 적용할 때는 BuildContext context를 이용
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Colors.red),
        ),
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? const MyLargeTitle() : const Text('Nothing'),
              IconButton(
                  onPressed: toggleTitle,
                  icon: const Icon(Icons.remove_red_eye))
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  @override
  void initState() {
    // build 전에 호출 됨
    // 변수 초기화는 State클래스 내에서 자체적으로 할 수 있으나,
    //부모 위젯에서 전달받은 변수를 초기화할 때는 initState()를 사용
    super.initState();
    print('init state');
  }

  @override
  void dispose() {
    // 위젯이 스크린에서 사라질 때 호출되는 메소드
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
