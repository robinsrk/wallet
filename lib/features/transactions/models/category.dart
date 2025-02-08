import 'package:flutter/material.dart';

class Category {
  final String id;
  final String name;
  final IconData icon;
  final Color color;
  final String? parentId;
  final bool isIncome;
  final String? description;

  const Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    this.parentId,
    required this.isIncome,
    this.description,
  });

  Category copyWith({
    String? id,
    String? name,
    IconData? icon,
    Color? color,
    String? parentId,
    bool? isIncome,
    String? description,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      parentId: parentId ?? this.parentId,
      isIncome: isIncome ?? this.isIncome,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon.codePoint,
      'color': color.value,
      'parentId': parentId,
      'isIncome': isIncome,
      'description': description,
    };
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as String,
      name: json['name'] as String,
      icon: IconData(json['icon'] as int, fontFamily: 'MaterialIcons'),
      color: Color(json['color'] as int),
      parentId: json['parentId'] as String?,
      isIncome: json['isIncome'] as bool,
      description: json['description'] as String?,
    );
  }

  static List<Category> defaultCategories = [
    Category(
      id: 'income_salary',
      name: 'Salary',
      icon: Icons.work_outline,
      color: Colors.green,
      isIncome: true,
    ),
    Category(
      id: 'income_investment',
      name: 'Investment',
      icon: Icons.trending_up,
      color: Colors.blue,
      isIncome: true,
    ),
    Category(
      id: 'expense_food',
      name: 'Food & Dining',
      icon: Icons.restaurant_outlined,
      color: Colors.orange,
      isIncome: false,
    ),
    Category(
      id: 'expense_shopping',
      name: 'Shopping',
      icon: Icons.shopping_bag_outlined,
      color: Colors.purple,
      isIncome: false,
    ),
    Category(
      id: 'expense_transport',
      name: 'Transport',
      icon: Icons.directions_car_outlined,
      color: Colors.blue,
      isIncome: false,
    ),
    Category(
      id: 'expense_utilities',
      name: 'Utilities',
      icon: Icons.home_outlined,
      color: Colors.brown,
      isIncome: false,
    ),
    Category(
      id: 'expense_healthcare',
      name: 'Healthcare',
      icon: Icons.medical_services_outlined,
      color: Colors.red,
      isIncome: false,
    ),
    Category(
      id: 'expense_entertainment',
      name: 'Entertainment',
      icon: Icons.movie_outlined,
      color: Colors.pink,
      isIncome: false,
    ),
  ];
}