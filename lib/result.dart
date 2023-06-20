import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;

  const Result(this.score, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Your Score : $score / 25",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 4
              ..color = Colors.blue[500]!,
          ),
        ),
        Image.asset('assets/cat.jpg'),
      ],
    ));
  }
}
