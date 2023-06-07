import 'package:flutter/material.dart';

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  static const List<String> myList = ['a', 'b', 'c'];
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
            children: [
              SizedBox(
                height: 100,
                child: ListView.builder(
                  itemCount: myList.length,
                  itemBuilder: (context, index) {
                    return Text(myList[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
