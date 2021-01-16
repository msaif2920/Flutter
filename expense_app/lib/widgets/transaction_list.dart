import 'package:expense_app/models/transaction.dart';
import "package:flutter/material.dart";
import "package:intl/intl.dart";

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;

  TransactionList(this._userTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
              child: Row(children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              padding: EdgeInsets.all(10),
              child: Text(
                "\$ ${_userTransactions[index].amount.toStringAsFixed(2)}",
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
                Text(_userTransactions[index].title,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(DateFormat.yMMMd().format(_userTransactions[index].date),
                    style: TextStyle(color: Colors.grey))
              ],
            )
          ]));
        },
        itemCount: _userTransactions.length,
      ),
    );
  }
}
