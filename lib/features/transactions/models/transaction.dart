import 'package:flutter/material.dart';

enum TransactionType {
  income,
  expense
}

class Transaction {
  final String id;
  final String title;
  final String category;
  final double amount;
  final DateTime date;
  final IconData icon;
  final TransactionType type;
  final String? note;

  Transaction({
    required this.id,
    required this.title,
    required this.category,
    required this.amount,
    required this.date,
    required this.icon,
    required this.type,
    this.note,
  });

  Transaction copyWith({
    String? id,
    String? title,
    String? category,
    double? amount,
    DateTime? date,
    IconData? icon,
    TransactionType? type,
    String? note,
  }) {
    return Transaction(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      icon: icon ?? this.icon,
      type: type ?? this.type,
      note: note ?? this.note,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'amount': amount,
      'date': date.toIso8601String(),
      'icon': icon.codePoint,
      'type': type.toString(),
      'note': note,
    };
  }

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'] as String,
      title: json['title'] as String,
      category: json['category'] as String,
      amount: json['amount'] as double,
      date: DateTime.parse(json['date'] as String),
      icon: IconData(json['icon'] as int, fontFamily: 'MaterialIcons'),
      type: TransactionType.values.firstWhere(
        (e) => e.toString() == json['type'],
      ),
      note: json['note'] as String?,
    );
  }
}