import 'dart:async';

import 'package:flutter/material.dart';

class CustomScreen extends StatefulWidget {
  const CustomScreen({super.key});

  @override
  State<CustomScreen> createState() => _CustomScreenState();
}

class _CustomScreenState extends State<CustomScreen> {
  static const fifteenMinutes = 15 * 60;
  int totalSeconds = fifteenMinutes;
  late Timer timer;
  bool isRunning = false;
  int totalPomodoros = 0;
  int pomodorsRound = 4;
  int totalGoals = 0;
  int goalsRound = 12;
  int selectedTimeSet = 15;
  bool isFirstStarted = false;

  List<int> timeSetList = [15, 20, 25, 30, 35];

  void onStartPressed() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (totalSeconds > 0) {
          totalSeconds--;
        } else {
          if (totalPomodoros == pomodorsRound) {
            totalPomodoros = 0;
            totalGoals++;
          }
          if (totalGoals == goalsRound) {
            totalGoals = 0;
          }
          totalPomodoros++;
          isRunning = false;
          totalSeconds = fifteenMinutes;
          timer.cancel();
        }
      });
    });
    setState(() {
      isRunning = true;
      isFirstStarted = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = !isRunning;
    });
  }

  void onResetPressed() {
    if (isFirstStarted) {
      timer.cancel();
      setState(() {
        isRunning = false;
        totalSeconds = fifteenMinutes;
        totalPomodoros = 0;
        totalGoals = 0;
        selectedTimeSet = timeSetList[0];
      });
    }
  }

  String format(int seconds) {
    return '${seconds ~/ 60}:${(seconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            // 스크롤 없이 지정된 영역을 비율로 나누는 위젯
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: Text(
                  'POMOTIMER',
                  style: TextStyle(
                      color: Theme.of(context).cardColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    format(totalSeconds),
                    // '${totalSeconds ~/ 60}:${totalSeconds % 60}',
                    style: TextStyle(
                        color: Theme.of(context).cardColor,
                        fontSize: 89,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var n in timeSetList)
                    TextButton(
                      onPressed: () {
                        setState(() {
                          totalSeconds = n * 60;
                          selectedTimeSet = n;
                        });
                      },
                      child: Text(
                        '$n',
                        style: TextStyle(
                          color: (selectedTimeSet == n)
                              ? Theme.of(context).cardColor
                              : Colors.grey[400],
                          fontSize: (selectedTimeSet == n) ? 30 : 20,
                          fontWeight: (selectedTimeSet == n)
                              ? FontWeight.w900
                              : FontWeight.w600,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  Text(
                    format(totalSeconds),
                    // '${totalSeconds ~/ 60}:${totalSeconds % 60}',
                    style: TextStyle(
                        color: Theme.of(context).cardColor,
                        fontSize: 89,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: IconButton(
                        iconSize: 120,
                        color: Theme.of(context).cardColor,
                        icon: Icon(isRunning
                            ? Icons.pause_circle_outline
                            : Icons.play_circle_outline),
                        onPressed: isRunning ? onPausePressed : onStartPressed,
                      ),
                    ),
                    isRunning
                        ? const SizedBox.shrink()
                        : Center(
                            child: IconButton(
                              iconSize: 120,
                              color: Theme.of(context).cardColor,
                              icon: const Icon(
                                  Icons.replay_circle_filled_outlined),
                              onPressed: onResetPressed,
                            ),
                          ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //남은 여백 채우기
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'ROUND',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          Text(
                            '$totalPomodoros/$pomodorsRound',
                            style: const TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'GOAL',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          Text(
                            '$totalGoals/$goalsRound',
                            style: const TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
