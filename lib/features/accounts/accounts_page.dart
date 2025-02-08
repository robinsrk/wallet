import 'package:flutter/material.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accounts'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildAccountCard(
            context,
            'Main Account',
            'Savings',
            10234.50,
            Icons.account_balance,
          ),
          const SizedBox(height: 16),
          _buildAccountCard(
            context,
            'Credit Card',
            '**** 1234',
            2111.17,
            Icons.credit_card,
          ),
          const SizedBox(height: 16),
          _buildAccountCard(
            context,
            'Investment',
            'Stocks & ETFs',
            5432.89,
            Icons.trending_up,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildAccountCard(
    BuildContext context,
    String name,
    String subtitle,
    double balance,
    IconData icon,
  ) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          child: Icon(icon),
        ),
        title: Text(
          name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(subtitle),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '\$${balance.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              'Available Balance',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}