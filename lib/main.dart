import 'package:flutter/material.dart';
import 'quizPage.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizzler by Zahreba Bohdan',
      home: QuizPage(),
    );
  }
}
