import "package:flutter/material.dart";

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = resultScore >= 8
        ? "Good Job"
        : resultScore >= 5
            ? "You are alright"
            : "Bruh you need to improve";
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(
          onPressed: resetHandler,
          child: Text("Restart Quiz"),
          textColor: Colors.blue,
        )
      ],
    ));
  }
}
