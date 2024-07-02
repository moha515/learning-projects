import 'package:expenss/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final Function removeItem;
  final List<Transaction> transactions;
  TransactionList(this.transactions, this.removeItem);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'no Transactions added yet',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  width: 120,
                  child: Image.asset(
                    'lib/assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                    elevation: 20,
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      leading: CircleAvatar(
                          radius: 30,
                          child: FittedBox(
                            child: Text(
                                "\$ ${transactions[index].amount.toStringAsFixed(2)}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    //  fontSize: 20,
                                    color: Colors.purple)),
                          )),
                      title: Text(
                        transactions[index].title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      subtitle: Text(
                        DateFormat('yyyy-MM-dd')
                            .format(transactions[index].date),
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () => removeItem(transactions[index].id),
                        icon: Icon(Icons.delete),
                        color: Colors.red,
                      ),
                    ));
              },
              itemCount: transactions.length,
            ),
    );
  }
}
