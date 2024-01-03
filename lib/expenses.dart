import 'package:flutter/material.dart';
import 'package:expense_tracker/expenseList.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
