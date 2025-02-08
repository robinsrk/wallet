import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          IconButton(
            icon: const Icon(Icons.done_all),
            onPressed: () {},
            tooltip: 'Mark all as read',
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildNotificationItem(
            icon: Icons.account_balance_wallet,
            title: 'Balance Update',
            description: 'Your current balance is \$12,345.67',
            time: '2 minutes ago',
            isRead: false,
          ),
          _buildNotificationItem(
            icon: Icons.shopping_bag,
            title: 'New Transaction',
            description: 'Shopping expense: -\$85.00',
            time: '1 hour ago',
            isRead: false,
          ),
          _buildNotificationItem(
            icon: Icons.attach_money,
            title: 'Salary Received',
            description: 'Salary credit: +\$2,450.00',
            time: '1 day ago',
            isRead: true,
          ),
          _buildNotificationItem(
            icon: Icons.warning,
            title: 'Low Balance Alert',
            description: 'Your savings account balance is below \$1,000',
            time: '2 days ago',
            isRead: true,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required IconData icon,
    required String title,
    required String description,
    required String time,
    required bool isRead,
  }) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(icon),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(description),
          const SizedBox(height: 4),
          Text(
            time,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      isThreeLine: true,
      trailing: isRead
          ? null
          : Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
            ),
    );
  }
}