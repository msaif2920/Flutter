import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleControllelr = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleControllelr.text;
    final entertedAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || entertedAmount <= 0) {
      return;
    }

    widget.addTransaction(
        titleControllelr.text, double.parse(amountController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleControllelr,
              keyboardType: TextInputType.text,
              onSubmitted: (_val) => submitData(),
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: "Amount"),
              keyboardType: TextInputType.number,
              onSubmitted: (_val) => submitData(),
            ),
            FlatButton(
                onPressed: submitData,
                child: Text("Add Transaction"),
                textColor: Colors.purple),
          ],
        ),
      ),
    );
  }
}
