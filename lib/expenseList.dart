// ignore_for_file: file_names

import 'package:flutter/Material.dart';
import 'package:expense_tracker/models/ExpenseModel.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({required this.registeredexpense, super.key});

  final List<Expense> registeredexpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: registeredexpense.length,
      itemBuilder: (ctx, index) {
        Text(registeredexpense[index].title);
      },
    );
  }
}
