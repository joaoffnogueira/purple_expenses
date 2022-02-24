import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  var title;
  var value;
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                onChanged: (text) {
                  title = text;
                },
                decoration: InputDecoration(labelText: 'Título'),
              ),
              TextField(
                  onChanged: (text) {
                    value = text;
                  },
                  decoration: InputDecoration(labelText: 'Valor')),
              TextButton(
                  onPressed: () {
                    onSubmit(title, double.tryParse(value) ?? 0.0);
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
