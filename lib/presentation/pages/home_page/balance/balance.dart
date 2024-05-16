import 'package:flutter/material.dart';
import 'package:sheker/utilities/app_colors.dart';

class BalanceGraph extends StatefulWidget {
  const BalanceGraph({super.key});

  @override
  State<BalanceGraph> createState() => _BalanceGraphState();
}

class _BalanceGraphState extends State<BalanceGraph> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColorsUtility.lightBackground,
          child: Column(
            children: [
              const SizedBox(
                height: 16.0,
              ),
              makeText('Portfolio Balance', fontSize: 16.0),
              const SizedBox(
                height: 4.0,
              ),
              makeText('\$2,760.23', fontSize: 32.0),
              const SizedBox(
                height: 4.0,
              ),
              makeText('+2.60%', fontSize: 16.0)
            ],
          ),
        ),
        Container(
          color: Colors.grey,
          height: 128.0,
          child: Center(child: makeText('GRAPH of Balance')),
        )
      ],
    );
  }

  Widget makeText(String text, {double? fontSize = 14.0}) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, color: AppColorsUtility.text),
    );
  }
}
