import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit, {Key? key}) : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  String title = '';
  double value = 0.0;
  DateTime selectedDate = DateTime.now();

  _submitForm() {
    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value, selectedDate);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
            ),
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
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    onSubmitted: (_) => _submitForm(),
                    decoration: InputDecoration(labelText: 'Valor')),
                Container(
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                            'Data: ${DateFormat('dd/MM/yyyy').format(selectedDate)}'),
                      ),
                      TextButton(
                          onPressed: _showDatePicker,
                          child: Text('Selecione uma data',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.primary)))
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: _submitForm, child: Text('Nova transação'))
              ],
            ),
          )),
    );
  }
}
