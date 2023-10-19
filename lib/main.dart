import 'package:flutter/material.dart';

void main() {
  runApp(const QuizPage());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
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
  List<Widget> scores = [
    Icon(Icons.check, color: Colors.green),
    Icon(Icons.close, color: Colors.red),
  ];

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
              child: Text('test '),
            ),
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              child: Text('True', textDirection: TextDirection.ltr),
              onPressed: () {},
            ),
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              child: Text('false', textDirection: TextDirection.ltr),
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ),
          // Row(
          //   children: scores,
          // )
        ],
      ),
    );
  }
}
