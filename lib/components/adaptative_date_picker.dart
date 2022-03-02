import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {
  DateTime selectedDate = DateTime.now();
  final Function(DateTime) onDateChanged;

  AdaptativeDatePicker(
      {required this.selectedDate, required this.onDateChanged, Key? key})
      : super(key: key);

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      onDateChanged(pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Container(
          height: 180,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            maximumDate: DateTime.now(),
            minimumDate: DateTime(2020),
            initialDateTime: DateTime.now(),
            onDateTimeChanged: onDateChanged,
          ),
        )
        : Container(
            height: 70,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                      'Data: ${DateFormat('dd/MM/yyyy').format(selectedDate)}'),
                ),
                TextButton(
                    onPressed: () => _showDatePicker(context),
                    child: Text('Selecione uma data',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary)))
              ],
            ),
          );
  }
}
