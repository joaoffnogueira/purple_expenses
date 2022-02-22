import 'package:flutter/material.dart';
import 'package:purple_expenses/components/transaction_user.dart';
import 'package:purple_expenses/models/transaction.dart';

void main() {
  runApp(const PurpleExpenses());
}

class PurpleExpenses extends StatelessWidget {
  const PurpleExpenses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Purple Expenses',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Purple Expenses'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Card(
              color: Colors.purple,
              elevation: 5,
              child: Text('Gráfico'),
            ),
          ),
          TransactionUser(),
        ],
      ),
    );
  }
}
