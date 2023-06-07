import 'package:flutter/material.dart';

class ScheduleInfo {
  final Color bgColor;
  final int startHour;
  final int startMinute;
  final int endHour;
  final int endMinute;
  final String firstWord;
  final String secondWord;
  final List<String> attendees;

  ScheduleInfo({
    required this.bgColor,
    required this.startHour,
    required this.startMinute,
    required this.endHour,
    required this.endMinute,
    required this.firstWord,
    required this.secondWord,
    required this.attendees,
  });
}

class CloneApp extends StatelessWidget {
  CloneApp({super.key});

  final List<ScheduleInfo> data = [
    ScheduleInfo(
        bgColor: Colors.yellow,
        startHour: 11,
        startMinute: 30,
        endHour: 12,
        endMinute: 20,
        firstWord: 'DESIGN',
        secondWord: 'METTING',
        attendees: ['ALEX', 'HELENA', 'NANA']),
    ScheduleInfo(
        bgColor: const Color.fromARGB(255, 164, 88, 177),
        startHour: 12,
        startMinute: 35,
        endHour: 14,
        endMinute: 10,
        firstWord: 'DESIGN',
        secondWord: 'PROJECT',
        attendees: [
          'ME',
          'RICHARD',
          'CIRY',
          'LEWIS',
          'JAMES',
          'ALEX',
          'HELENA'
        ]),
    ScheduleInfo(
        bgColor: Colors.green,
        startHour: 15,
        startMinute: 0,
        endHour: 16,
        endMinute: 30,
        firstWord: 'WEEKLY',
        secondWord: 'PLANNING',
        attendees: ['DEN', 'NANA', 'MARK']),
  ];
  @override
  Widget build(BuildContext context) {
    final remainedDate = [17, 18, 19, 20, 21, 22];
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
                    for (var n in remainedDate)
                      Row(
                        children: [
                          Text(
                            '$n',
                            style: TextStyle(
                                fontSize: 42,
                                color: Colors.white.withOpacity(0.6),
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              SizedBox(
                //TODO: SingleScroll Column 안에서 ListView.builder 사용 시 height 지정 필요
                height: 1000,
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ScheduleCard(
                      order: index,
                      bgColor: data[index].bgColor,
                      startHour: data[index].startHour,
                      startMinute: data[index].startMinute,
                      endHour: data[index].endHour,
                      endMinute: data[index].endMinute,
                      firstWord: data[index].firstWord,
                      secondWord: data[index].secondWord,
                      attendees: data[index].attendees,
                    );
                  },
                ),
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
  final List<String> attendees;

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
    required this.attendees,
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
              // TODO: 참석자 리스트 조건 걸고 표시하기
              for (var attendee in attendees)
                Row(
                  children: [
                    const SizedBox(
                      width: 40,
                    ),
                    Text(attendee),
                  ],
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
