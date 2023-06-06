import 'package:flutter/material.dart';

class CloneApp extends StatelessWidget {
  const CloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: 1. 오늘 이후 남은 날짜를 List로 넘겨서 Text Widget을 여러개 리턴하도록 수정 필요
    // final remainedDate = [17, 18, 19, 20, 21, 22];
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 50,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    image: AssetImage('lib/assets/images/profile.png'),
                    width: 80,
                    height: 80,
                  ),
                  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 40,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Text(
                    'MONDAY',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '16',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'TODAY',
                      style: TextStyle(
                          fontSize: 42,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '·',
                      style: TextStyle(
                          fontSize: 42,
                          color: Colors.pink[600],
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '17',
                      style: TextStyle(
                          fontSize: 42,
                          color: Colors.white.withOpacity(0.6),
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      '18',
                      style: TextStyle(
                          fontSize: 42,
                          color: Colors.white.withOpacity(0.6),
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      '19',
                      style: TextStyle(
                          fontSize: 42,
                          color: Colors.white.withOpacity(0.6),
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      '20',
                      style: TextStyle(
                          fontSize: 42,
                          color: Colors.white.withOpacity(0.6),
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              // TODO: 3. 미팅 참가자들도 마찬가지로 List로 명단을 넘겨서 ListView.builder?로 처리하는 방법 적용 필요
              const ScheduleCard(
                order: 0,
                bgColor: Colors.yellow,
                startHour: 11,
                startMinute: 30,
                endHour: 12,
                endMinute: 20,
                firstWord: 'DESIGN',
                secondWord: 'MEETING',
              ),
              const ScheduleCard(
                order: 1,
                bgColor: Color.fromARGB(255, 164, 88, 177),
                startHour: 12,
                startMinute: 35,
                endHour: 14,
                endMinute: 10,
                firstWord: 'DAILY',
                secondWord: 'PROJECT',
              ),
              const ScheduleCard(
                order: 2,
                bgColor: Colors.green,
                startHour: 15,
                startMinute: 00,
                endHour: 16,
                endMinute: 30,
                firstWord: 'WEEKLY',
                secondWord: 'PLANNING',
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final Color bgColor;
  final int startHour;
  final int startMinute;
  final int endHour;
  final int endMinute;
  final String firstWord;
  final String secondWord;
  final int order;

  const ScheduleCard({
    super.key,
    required this.bgColor,
    required this.startHour,
    required this.startMinute,
    required this.endHour,
    required this.endMinute,
    required this.firstWord,
    required this.secondWord,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, order * 12),
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        startHour.toString(),
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(startMinute.toString()),
                      const Text('|'),
                      Text(
                        endHour.toString(),
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(endMinute.toString()),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    '$firstWord \n$secondWord',
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                    ),
                    // TODO: 2. Row 안에서 텍스트 줄바꿈 방법?
                    // overflow: TextOverflow.visible,
                    // softWrap: true,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Text('ALEX'),
                  SizedBox(
                    width: 30,
                  ),
                  Text('HELENA'),
                  SizedBox(
                    width: 30,
                  ),
                  Text('NANA'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
