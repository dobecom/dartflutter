import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final IconData icon;
  final String currencyName;
  final String currencyAmount;
  final String currencyCode;
  final bool isInverted;
  final int order;
  final _blackColor = const Color(0xFF1F2123);

  const CurrencyCard(
      {super.key,
      required this.currencyName,
      required this.currencyAmount,
      required this.currencyCode,
      required this.icon,
      required this.isInverted,
      required this.order});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, order * -20),
      child: Container(
          // 컨테이너 공간을 초과한 부분을 잘라줌
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: isInverted ? _blackColor : Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currencyName,
                      style: TextStyle(
                          color: isInverted ? Colors.white : _blackColor,
                          fontSize: 32,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          currencyAmount,
                          style: TextStyle(
                            color: isInverted ? Colors.white : _blackColor,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          currencyCode,
                          style: TextStyle(
                            color: isInverted
                                ? Colors.white.withOpacity(0.8)
                                : _blackColor,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // 아이콘의 크기를 overflow 시키는 디자인 표현하기 위해 아이콘 비율 늘림
                Transform.scale(
                  scale: 2,
                  child:
                      // 위젯 위치를 이동시키는 표현(SizedBox를 쓰게 된다면 Card 자체 크기가 변동되는 문제)
                      Transform.translate(
                    offset: const Offset(-5, 11),
                    child: Icon(
                      icon,
                      color: isInverted ? Colors.white : _blackColor,
                      size: 88,
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
