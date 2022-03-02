import 'package:flutter/material.dart';
import 'package:purple_expenses/components/adaptative_button.dart';
import 'package:purple_expenses/components/adaptative_date_picker.dart';
import 'package:purple_expenses/components/adaptative_textfield.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit, {Key? key}) : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _valueController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;
    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value, selectedDate);
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
                AdaptativeTextField(
                  controller: _titleController,
                  onSubmitted: (_) => _submitForm(),
                  label: 'Título',
                ),
                AdaptativeTextField(
                    controller: _valueController,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    onSubmitted: (_) => _submitForm(),
                    label: 'Valor'),
                AdaptativeDatePicker(
                  selectedDate: selectedDate,
                  onDateChanged: (newDate) {
                    setState(() {
                      selectedDate = newDate;
                    });
                  },
                ),
                AdaptativeButton(
                    onPressed: _submitForm, label: 'Nova transação')
              ],
            ),
          )),
    );
  }
}
