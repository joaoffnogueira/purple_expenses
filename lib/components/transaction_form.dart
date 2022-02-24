import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit, {Key? key}) : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  String title = '';

  double value = 0.0;

  _submitForm() {
    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value);
  }

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
                onSubmitted: (_) => _submitForm(),
                decoration: InputDecoration(labelText: 'Título'),
              ),
              TextField(
                  onChanged: (text) {
                    value = double.tryParse(text) ?? 0.0;
                  },
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onSubmitted: (_) => _submitForm(),
                  decoration: InputDecoration(labelText: 'Valor')),
              TextButton(
                  onPressed: _submitForm,
                  child: Text(
                    'Nova transação',
                    style: TextStyle(color: Colors.purple),
                  ))
            ],
          ),
        ));
  }
}
