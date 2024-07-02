import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);
  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  DateTime? selecDate;
  final amountController = TextEditingController();

  void submitData() {
    if (amountController.text.isEmpty) {
      return;
    }
    final enterTitle = titleController.text;
    final entertAmount = double.parse(amountController.text);
    if (enterTitle.isEmpty || entertAmount <= 0 || selecDate == null) {
      return;
    }
    widget.addTx(
      enterTitle,
      entertAmount,
      selecDate,
    );
    Navigator.of(context).pop();
  }

  void showDatepick() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selecDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              controller: amountController,
              onSubmitted: (_) => submitData(),
            ),
            Container(
              height: 70,
              child: Row(children: [
                Expanded(
                  child: Text(selecDate == null
                      ? 'No Date Choosen'
                      : 'The Date choose is : ${DateFormat.yMd().format(selecDate!)}'),
                ),
                TextButton(
                    onPressed: showDatepick,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.purple),
                    ))
              ]),
            ),
            OutlinedButton(
              onPressed: submitData,
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.purple)),
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
