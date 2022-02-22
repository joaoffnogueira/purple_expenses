import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  TransactionForm({Key? key}) : super(key: key);

  final transactionTitleController = TransactionTitleController();
  final transactionValueController = TransactionValueController();

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: transactionTitleController,
                decoration: InputDecoration(labelText: 'Título'),
              ),
              TextField(
                  controller: transactionValueController,
                  decoration: InputDecoration(labelText: 'Valor')),
              TextButton(
                  onPressed: () {
                    print(transactionTitleController.text);
                    print(transactionValueController.text);
                  },
                  child: Text(
                    'Nova transação',
                    style: TextStyle(color: Colors.purple),
                  ))
            ],
          ),
        ));
  }
}
