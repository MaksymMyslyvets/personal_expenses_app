import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/models/transaction.dart';

class TransactionListItem extends StatelessWidget {
  const TransactionListItem({
    Key? key,
    required this.transaction,
    required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 4,
            ),
          ),
          child: FittedBox(
            child: Text(
              '\$${transaction.amount.toStringAsFixed(2)}',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
          style: TextStyle(
            fontSize: 10,
            color: Colors.grey,
          ),
        ),
        trailing: IconButton(
          color: Colors.grey[400],
          icon: Icon(Icons.delete),
          onPressed: () => deleteTransaction(transaction.id),
        ),
      ),
    );
  }
}
