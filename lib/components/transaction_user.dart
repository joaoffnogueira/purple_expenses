import 'package:flutter/material.dart';
import 'package:purple_expenses/components/transaction_form.dart';
import 'package:purple_expenses/components/transaction_list.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({ Key? key }) : super(key: key);

  @override
  _TransactionUserState createState() => _TransactionUserState();
}

final _transactions = [
    Transaction(
        id: 't1', title: 'Supermercado', value: 30.65, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Academia', value: 69.99, date: DateTime.now()),
  ];

class _TransactionUserState extends State<TransactionUser> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(_transactions),
        TransactionForm(),
      ],
    );
  }
}