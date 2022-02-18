import 'package:flutter/material.dart';
import 'package:purple_expenses/models/transaction.dart';
import 'package:intl/intl.dart';

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
  final _transactions = [
    Transaction(
        id: 't1', title: 'Supermercado', value: 30.65, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Academia', value: 69.99, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Card(
              color: Colors.purple,
              elevation: 5,
              child: Text('Gráfico'),
            ),
          ),
          Column(
            children: _transactions.map((transaction) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.purple,
                        width: 2,
                      )),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'R\$ ${transaction.value.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transaction.title,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat('d MMM y').format(transaction.date),
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
