import 'package:flutter/material.dart';
import "package:intl/intl.dart";
import "./transaction.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: "t1", title: "New Shoes", amount: 33.99, date: DateTime.now()),
    Transaction(
        id: "t2", title: "Grocery", amount: 123.99, date: DateTime.now())
  ];

  String titleInput;
  String amountInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense App"),
      ),
      body: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text("CHART !"),
                elevation: 5,
              ),
            ),
            Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: "Title"),
                      onChanged: (value) {
                        titleInput = value;
                      },
                    ),
                    TextField(
                        onChanged: (value) {
                          amountInput = value;
                        },
                        decoration: InputDecoration(labelText: "Amount")),
                    FlatButton(
                        onPressed: () {},
                        child: Text("Add Transaction"),
                        textColor: Colors.purple),
                  ],
                ),
              ),
            ),
            Column(
                children: transactions.map((tx) {
              return Card(
                  child: Row(children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "\$ ${tx.amount}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(tx.title,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(DateFormat.yMMMd().format(tx.date),
                        style: TextStyle(color: Colors.grey))
                  ],
                )
              ]));
            }).toList())
          ]),
    );
  }
}
