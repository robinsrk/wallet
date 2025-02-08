import 'package:flutter/material.dart';

enum AccountType {
  cash,
  bankAccount,
  creditCard,
  investment,
  savings
}

class Account {
  final String id;
  final String name;
  final AccountType type;
  final double balance;
  final String? accountNumber;
  final Color color;
  final IconData icon;
  final String? bankName;
  final bool isArchived;

  const Account({
    required this.id,
    required this.name,
    required this.type,
    required this.balance,
    this.accountNumber,
    required this.color,
    required this.icon,
    this.bankName,
    this.isArchived = false,
  });

  Account copyWith({
    String? id,
    String? name,
    AccountType? type,
    double? balance,
    String? accountNumber,
    Color? color,
    IconData? icon,
    String? bankName,
    bool? isArchived,
  }) {
    return Account(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      balance: balance ?? this.balance,
      accountNumber: accountNumber ?? this.accountNumber,
      color: color ?? this.color,
      icon: icon ?? this.icon,
      bankName: bankName ?? this.bankName,
      isArchived: isArchived ?? this.isArchived,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type.toString(),
      'balance': balance,
      'accountNumber': accountNumber,
      'color': color.value,
      'icon': icon.codePoint,
      'bankName': bankName,
      'isArchived': isArchived,
    };
  }

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'] as String,
      name: json['name'] as String,
      type: AccountType.values.firstWhere(
        (e) => e.toString() == json['type'],
      ),
      balance: json['balance'] as double,
      accountNumber: json['accountNumber'] as String?,
      color: Color(json['color'] as int),
      icon: IconData(json['icon'] as int, fontFamily: 'MaterialIcons'),
      bankName: json['bankName'] as String?,
      isArchived: json['isArchived'] as bool? ?? false,
    );
  }

  static List<Account> defaultAccounts = [
    Account(
      id: 'cash_wallet',
      name: 'Cash Wallet',
      type: AccountType.cash,
      balance: 500.00,
      color: Colors.green,
      icon: Icons.account_balance_wallet_outlined,
    ),
    Account(
      id: 'main_bank',
      name: 'Main Bank Account',
      type: AccountType.bankAccount,
      balance: 2500.00,
      accountNumber: '**** 1234',
      color: Colors.blue,
      icon: Icons.account_balance_outlined,
      bankName: 'Example Bank',
    ),
    Account(
      id: 'credit_card',
      name: 'Credit Card',
      type: AccountType.creditCard,
      balance: -350.00,
      accountNumber: '**** 5678',
      color: Colors.purple,
      icon: Icons.credit_card_outlined,
      bankName: 'Example Bank',
    ),
  ];
}