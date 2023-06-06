import 'package:dartflutter/widgets/button.dart';
import 'package:dartflutter/widgets/currency_card.dart';
import 'package:flutter/material.dart';

class Player {
  final String name;
  Player({required this.name});
}

void main() {
  var steve = Player(name: 'Steve');
  runApp(App(name: steve.name));
}

class App extends StatelessWidget {
  final String name;
  const App({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // 16진법 색상코드 표기법 0xFF + 색상코드
        // 또는 ARGB 표기법 0x + 알파값 + 색상코드 (Color에 커서 올리면 색상표 지원)
        backgroundColor: const Color(0xFF181818),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 공간 여백을 주기 위한 SizedBox
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Hello $name',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 34,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Welcom back',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Total Balance',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '\$5 194 482',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 42,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  // 리스트 요소 수만큼 공간을 동일하게 분할
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      text: 'Transfer',
                      bgColor: Color(0xFFF1B33B),
                      textColor: Colors.black,
                    ),
                    Button(
                      text: 'Request',
                      bgColor: Color(0xFF1F2123),
                      textColor: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Wallets',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

                //const Color(0xFF1F2123),
                const CurrencyCard(
                  icon: Icons.euro_rounded,
                  currencyName: 'Euro',
                  currencyAmount: '6428',
                  currencyCode: 'EUR',
                  isInverted: true,
                  order: 0,
                ),
                const CurrencyCard(
                  icon: Icons.currency_bitcoin,
                  currencyName: 'Bitcoin',
                  currencyAmount: '9785',
                  currencyCode: 'BTC',
                  isInverted: false,
                  order: 1,
                ),
                const CurrencyCard(
                  icon: Icons.attach_money_outlined,
                  currencyName: 'Dollar',
                  currencyAmount: '428',
                  currencyCode: 'USD',
                  isInverted: true,
                  order: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
