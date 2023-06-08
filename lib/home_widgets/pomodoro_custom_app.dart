import 'package:flutter/material.dart';

import '../screens/custom_screen.dart';

class PomodoroCustomApp extends StatelessWidget {
  const PomodoroCustomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              color: Colors.red,
            ),
          ),
          cardColor: const Color(0xFFF4EDDB),
          colorScheme: ColorScheme.fromSwatch(
            backgroundColor: Colors.red,
          ),
        ),
        home: const CustomScreen());
  }
}
