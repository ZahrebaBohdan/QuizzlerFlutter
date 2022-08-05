import 'package:flutter/material.dart';
import 'package:quizzler/hint.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizPage.dart';
import 'quizbrain.dart';

QuizBrain quizBrain = QuizBrain();
List<Icon> scoreKeeper = [];

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizzler by Zahreba Bohdan',
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: HintButton(),
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}
