import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

enum Category { food, leisure, travel, work }

final categoryIcons = {
  Category.food: Icons.restaurant_menu,
  Category.leisure: Icons.movie,
  Category.travel: Icons.flight_rounded,
  Category.work: Icons.work
};

final fomatter = DateFormat.yMd();

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return fomatter.format(date);
  }
}
