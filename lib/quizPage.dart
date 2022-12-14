import 'package:flutter/material.dart';
import 'package:quizzler/quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'hint.dart';

QuizBrain quizBrain = QuizBrain();
List<Icon> scoreKeeper = [];

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();
    setState(() {
      if (correctAnswer == userPickedAnswer) {
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      if (quizBrain.isFinished()) {
        print('${quizBrain.isFinished()}');
        quizBrain.reset();
        Alert(
          context: context,
          type: AlertType.success,
          title: 'Congratulations!',
          desc: 'You\'ve completed the quiz',
          buttons: [
            DialogButton(
              child: Text(
                'Home',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              color: Color.fromRGBO(0, 179, 134, 1.0),
              onPressed: () => Navigator.pop(context),
            ),
            DialogButton(
              child: Text(
                'Try again',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              color: Colors.cyan,
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ).show();
      } else {
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: HintButton(),
      backgroundColor: Colors.grey.shade900,
      body: Container(
        color: Colors.grey[900],
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        quizBrain.getQuestionText(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: FlatButton(
                      textColor: Colors.white,
                      color: Colors.green,
                      child: Text(
                        'True',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      onPressed: () {
                        checkAnswer(true);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: FlatButton(
                      color: Colors.red,
                      child: Text(
                        'False',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        checkAnswer(false);
                      },
                    ),
                  ),
                ),
                Wrap(children: scoreKeeper),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
