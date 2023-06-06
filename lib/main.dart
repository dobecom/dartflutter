import 'package:flutter/material.dart';

import 'home_widgets/clone_app.dart';

class Player {
  final String name;
  Player({required this.name});
}

void main() {
  // 1. UI Challenge - My Wallet
  // var steve = Player(name: 'Steve');
  // runApp(StartApp(name: steve.name));

  // 2. Clone App - My Schedule
  runApp(const CloneApp());
}
