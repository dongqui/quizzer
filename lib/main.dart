import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scores = [];
  List<Question> questions = [
    Question(questionText: '지구는 둥글다', questionAnswer: true),
    Question(questionText: '주식은 어렵다', questionAnswer: true),
    Question(questionText: '코딩은 쉽다', questionAnswer: false)
  ];

  int questionNumber = 0;

  void onPressButton(bool answer, BuildContext context) {
    setState(() {
      if (questions[questionNumber].questionAnswer == answer) {
        scores.add(const Icon(Icons.check, color: Colors.green));
      } else {
        scores.add(const Icon(Icons.close, color: Colors.red));
      }

      if (questionNumber >= questions.length - 1) {
        Alert(context: context, title: "문제 종료", desc: "문제 끝").show();
        return;
      }
      questionNumber++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Text(
                questions[questionNumber].questionText,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              child: const Text('True', textDirection: TextDirection.ltr),
              onPressed: () {
                onPressButton(true, context);
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('False', textDirection: TextDirection.ltr),
              onPressed: () {
                onPressButton(false, context);
              },
            ),
          ),
          Row(
            children: scores,
          )
        ],
      ),
    );
  }
}
