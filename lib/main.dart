import 'package:flutter/material.dart';

import 'home_widgets/init_state_app.dart';

class Player {
  final String name;
  Player({required this.name});
}

void main() {
  // 1. UI Challenge - My Wallet
  // var steve = Player(name: 'Steve');
  // runApp(StartApp(name: steve.name));

  // 2. Clone App - My Schedule
  // runApp(const CloneApp());

  // 3. Stateful App - setState
  // runApp(const StateApp());

  // 4. Theme App
  // runApp(const ThemeApp());

  // 5. Init State App - Widget Life Cycle (Init - Build - Dispose)
  runApp(const InitStateApp());
}
