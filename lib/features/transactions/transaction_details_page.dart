import 'package:flutter/material.dart';

class TransactionDetailsPage extends StatelessWidget {
  final IconData icon;
  final String title;
  final String date;
  final double amount;
  final String category;

  const TransactionDetailsPage({
    super.key,
    required this.icon,
    required this.title,
    required this.date,
    required this.amount,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Details'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 32,
                    child: Icon(icon, size: 32),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${amount >= 0 ? '+' : ''}\$${amount.abs().toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: amount >= 0 ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.category),
                  title: const Text('Category'),
                  subtitle: Text(category),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.calendar_today),
                  title: const Text('Date'),
                  subtitle: Text(date),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.account_balance_wallet),
                  title: const Text('Account'),
                  subtitle: const Text('Main Account'),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.note),
                  title: const Text('Note'),
                  subtitle: const Text('No note added'),
                  onTap: () {
                    // Handle add note
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.receipt_long),
                  title: const Text('Receipt'),
                  subtitle: const Text('No receipt attached'),
                  onTap: () {
                    // Handle add receipt
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}