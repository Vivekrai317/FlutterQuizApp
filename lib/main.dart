import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var totalScore = 0;
  static const List<Map<String, dynamic>> _questions = [
    {
      "question": "Which of the following physical quantity has S.I. unit J/C?",
      "answers": [
        "Electric Flux",
        "Dipole Moment",
        "Electric potential",
        "Electric Field Intensity"
      ],
      "correctAns": "Electric potential",
    },
    {
      "question":
          "The path of electrons in the presence of an electric field is:",
      "answers": ["Straight", "Curved", "Zig-Zag", "None of the Above"],
      "correctAns": "Curved",
    },
    {
      "question":
          "The electromagnetic waves can be transmitted through which of the following processes?",
      "answers": [
        "Space Wave Propagation",
        "Ground wave propagation",
        "Sky wave propagation",
        "All of the above"
      ],
      "correctAns": "All of the above",
    },
    {
      "question": "Rutherford's model was unable to explain:",
      "answers": [
        "Neutrality of an atom",
        "Photoelectric effect",
        "Stability of an atom",
        "Thermionic emissions"
      ],
      "correctAns": "Stability of an atom",
    },
    {
      "question":
          "Balmer series of the hydrogen emission spectrum lies in which region?",
      "answers": [
        "Ultraviolet region",
        "Visible region",
        "Far infrared region",
        "None of the above"
      ],
      "correctAns": "Visible region",
    },
  ];

  void _answerQuestion(int res) {
    setState(() {
      totalScore += res;
      _questionIndex = (_questionIndex + 1);
    });
  }

  void _resetQuiz() {
    setState(() {
      totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My app",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("UE218110"),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Text(
            "Reset Quiz",
            textAlign: TextAlign.center,
          ),
          onPressed: () {
            _resetQuiz();
          },
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          child: _questionIndex >= _questions.length
              ? Result(totalScore)
              : Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
