// ignore_for_file: file_names

import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
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
        return ExpenseItem(expense: registeredexpense[index]);
      },
    );
  }
}
