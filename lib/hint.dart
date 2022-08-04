import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizbrain.dart';
import 'main.dart';

class HintButton extends StatefulWidget {
  const HintButton({Key key}) : super(key: key);

  @override
  State<HintButton> createState() => _HintButtonState();
}

class _HintButtonState extends State<HintButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FloatingActionButton(
        hoverColor: Colors.yellow,
        backgroundColor: Colors.yellow[700],
        child: Icon(
          Icons.lightbulb_outline_rounded,
          size: 30,
          shadows: [
            Shadow(blurRadius: 1, color: Colors.white),
            Shadow(blurRadius: 1, color: Colors.white),
            Shadow(blurRadius: 1, color: Colors.white),
            Shadow(blurRadius: 1, color: Colors.white),
            Shadow(blurRadius: 1, color: Colors.white),
            Shadow(blurRadius: 1, color: Colors.white),
            Shadow(blurRadius: 30, color: Colors.white),
            Shadow(blurRadius: 30, color: Colors.white),
            Shadow(blurRadius: 30, color: Colors.white),
            Shadow(blurRadius: 30, color: Colors.white),
          ],
        ),
        onPressed: () => Alert(
          context: context,
          title: '${quizBrain.getQuestionText()} is...',
          desc: '${quizBrain.getQuestionAnswer()}',
          buttons: [
            DialogButton(
              child: Text(
                'OK',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ).show(),
      ),
    );
  }
}
