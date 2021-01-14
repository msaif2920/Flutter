import "package:flutter/material.dart";
import "./quiz.dart";
import "./result.dart";

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
  final questions = const [
    {
      "questionText": "whats your favorite programming language",
      'answers': [
        {"text": "C++", "score": 5},
        {"text": "Java", "score": 4},
        {"text": "Python", "score": 3},
        {"text": "JavaScript", "score": 1}
      ]
    },
    {
      "questionText": "Whats you favorite editor",
      "answers": [
        {"text": "Eclipse", "score": 5},
        {"text": "vsCode", "score": 4},
        {"text": "Visual Studio", "score": 3},
        {"text": "Intellij", "score": 1}
      ]
    }
  ];

  var questionIndex = 0;
  var totalScore = 0;

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }

  void answerQuestion(int score) {
    totalScore += score;
    setState(() {
      questionIndex += 1;
    });
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('First App'),
            ),
            body: questionIndex < questions.length
                ? Quiz(
                    questions: questions,
                    answerQuestion: answerQuestion,
                    questionIndex: questionIndex)
                : Result(totalScore, resetQuiz)));
  }
}
