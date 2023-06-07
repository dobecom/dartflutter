import 'package:flutter/material.dart';

class StateApp extends StatefulWidget {
  const StateApp({super.key});

  @override
  State<StateApp> createState() => _StateAppState();
}

class _StateAppState extends State<StateApp> {
  List<int> numbers = [];

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Click Count'),
              for (var n in numbers) Text('$n'),
              // Text('$counter'),
              IconButton(
                  iconSize: 20,
                  onPressed: onClick,
                  icon: const Icon(
                    Icons.add_box_rounded,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void onClick() {
    // setState는 onPressed를 호출하는 위젯 build를 다시 호출한다.
    // counter += 1; 을 setState 밖에 두어도 기대한 결과가 나온다.
    // (빌드가 다시 호출되기 때문)
    setState(() {
      numbers.add(numbers.length);
      // counter += 1;
    });
  }
}
