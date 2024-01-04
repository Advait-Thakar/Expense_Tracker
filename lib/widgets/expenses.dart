import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses_list/expenseList.dart';
import 'package:expense_tracker/models/ExpenseModel.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expenses> {
  final List<Expense> _expenseList = [
    Expense(
        title: 'flutter course',
        amount: 2999.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Cinema',
        amount: 649.59,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _addexpenseoverlay() {
    showModalBottomSheet(
        context: context, builder: (ctx) => const New_Expense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addexpenseoverlay,
          )
        ],
      ),
      body: Column(
        children: [
          const Text('Charts.....'),
          Expanded(
            child: ExpenseList(registeredexpense: _expenseList),
          ),
        ],
      ),
    );
  }
}
