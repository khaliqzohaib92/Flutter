import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController =
      TextEditingController(); // solution to get text field text on submit click in a stateless widget
  final amountController = TextEditingController();
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  void submitData() {
    final eneteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (eneteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addNewTransaction(eneteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: titleController,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) {
              //   amountInput = val;
              // },
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
