import 'dart:math';
import 'package:flutter/material.dart';
import 'package:purple_expenses/components/transaction_form.dart';
import 'package:purple_expenses/components/transaction_list.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({Key? key}) : super(key: key);

  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
        id: 't1', title: 'Supermercado', value: 30.65, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Academia', value: 69.99, date: DateTime.now()),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(_addTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}
