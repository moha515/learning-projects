import 'package:expenss/widget/chart.dart';
import 'package:expenss/widget/new_transaction.dart';
import './widget/transaction_list.dart';
import 'package:flutter/material.dart';
import './model/transaction.dart';

void main() {
  runApp(MaterialApp(
    home: Expenss(),
  ));
}

// ignore: use_key_in_widget_constructors
class Expenss extends StatefulWidget {
  @override
  State<Expenss> createState() => _ExpenssState();
}

class _ExpenssState extends State<Expenss> {
  final List<Transaction> userTransactions = [
    // Transaction(
    //     id: 't1', title: 'New shoes', amount: 70.00, date: DateTime.now()),
    // Transaction(
    //     id: 't2', title: 'New shirt', amount: 40.00, date: DateTime.now())
  ];
  List<Transaction> get recentTransactions {
    return userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  void addNewtransatction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );
    setState(() {
      userTransactions.add(newTx);
    });
  }

  void startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(addNewtransatction);
      },
    );
  }

  void deletTransaction(String id) {
    setState(() {
      userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.purple, fontFamily: 'Pacifico'),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: const Text(
              'Expenss',
              style: TextStyle(color: Colors.blue),
            ),
            actions: [
              IconButton(
                  onPressed: () => startNewTransaction(context),
                  icon: Icon(Icons.add))
            ],
          ),
          body: Column(
            children: [
              Chart(recentTransactions),
              TransactionList(userTransactions, deletTransaction),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => startNewTransaction(context),
            child: Icon(Icons.add),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ));
  }
}
