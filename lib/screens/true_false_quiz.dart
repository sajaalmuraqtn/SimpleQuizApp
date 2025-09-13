import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_std/logic/true_false/true_false_brain.dart';
import 'package:quiz_std/screens/multiple_quiz.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class TrueFalseApp extends StatefulWidget {
  TrueFalseApp({super.key});

  @override
  State<TrueFalseApp> createState() => _TrueFalseAppState();
}

class _TrueFalseAppState extends State<TrueFalseApp> {
  TrueFalseQuestionBrain quizBrain = TrueFalseQuestionBrain();
  List<Icon> scorekeeper = [];
  bool isFinish = false;

  void addUserScore(userAnswer) {
    if (quizBrain.isFinish()) {
      Alert(
        context: context,
        type: AlertType.success,
        title: "Done True False Questions",
        desc: "multi Questions Next",
      ).show();
      Timer(Duration(seconds: 3), () {
        quizBrain.reset();
        scorekeeper.clear();
        Navigator.pushReplacement( // will go to the myltipleQuiz Screen
          context,
          MaterialPageRoute(builder: (context) => MultipleQuiz()),
        );
      });
    } else {
      setState(() {
        quizBrain.checkAnswer(true)
            ? scorekeeper.add(Icon(Icons.check, color: Colors.green))
            : scorekeeper.add(Icon(Icons.close, color: Colors.red));
        quizBrain.nextQuestion();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 6,
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () => addUserScore(true),
                  child: Text("True", style: TextStyle(color: Colors.white)),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green),
                  ),
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () => addUserScore(false),
                  child: Text("False", style: TextStyle(color: Colors.white)),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red),
                  ),
                ),
              ),
            ),
            Row(children: scorekeeper),
          ],
        ),
      ),
    );
  }
}
