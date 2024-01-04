import 'package:flutter/material.dart';

import 'package:expense_tracker/models/ExpenseModel.dart';

class New_Expense extends StatefulWidget {
  const New_Expense({super.key});

  @override
  State<StatefulWidget> createState() {
    return _New_Expense_State();
  }
}

class _New_Expense_State extends State<New_Expense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.work;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void checkValidity() {
    final amt = double.tryParse(_amountController.text);
    if (_titleController.text.trim().isEmpty || amt == null || amt <= 0) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('INVALID INPUT'),
          content: const Text(
              'PLEASE MAKE SURE THAT A VALID TITLE, AMOUNT, DATE AND CATEGORY WAS SELECTED'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('OKAY'),
            )
          ],
        ),
      );
      return;
    }
  }

  void _pickDate() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final lastDate = DateTime.now();

    final _pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    setState(
      () {
        _selectedDate = _pickedDate;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$',
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'No Date Selected'
                          : fomatter.format(_selectedDate!),
                    ),
                    IconButton(
                        onPressed: _pickDate,
                        icon: const Icon(Icons.calendar_month_sharp)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          DropdownButton(
            value: _selectedCategory,
            items: Category.values
                .map(
                  (category) => DropdownMenuItem(
                    value: category,
                    child: Text(
                      category.name.toUpperCase(),
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value == null) {
                return;
              }
              setState(
                () {
                  _selectedCategory = value;
                },
              );
            },
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: checkValidity,
                child: const Text('Save Expense'),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              )
            ],
          )
        ],
      ),
    );
  }
}
