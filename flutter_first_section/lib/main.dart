import "package:flutter/material.dart";
import './question.dart';
import "./answer.dart";
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0;
  void answerQuestion() {
    setState(() {
      var rng = new Random();
      var num = rng.nextInt(2);
      questionIndex = num;
    });
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      "whats your favorite programming language",
      "Whats you favorite editor"
    ];

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('First App'),
            ),
            body: Column(
              children: <Widget>[
                Question(questions[questionIndex]),
                Answer(answerQuestion),
                Answer(answerQuestion),
                Answer(answerQuestion)
              ],
            )));
  }
}
