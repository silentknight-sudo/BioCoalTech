import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _DashboardCard(
            title: 'Production',
            value: '2.5 tons',
            icon: Icons.factory,
            color: Colors.blue,
            onTap: () {
              // TODO: Navigate to production details
            },
          ),
          _DashboardCard(
            title: 'Revenue',
            value: '₹25,000',
            icon: Icons.currency_rupee,
            color: Colors.green,
            onTap: () {
              // TODO: Navigate to revenue details
            },
          ),
          _DashboardCard(
            title: 'Efficiency',
            value: '85%',
            icon: Icons.trending_up,
            color: Colors.orange,
            onTap: () {
              // TODO: Navigate to efficiency details
            },
          ),
          _DashboardCard(
            title: 'Quality',
            value: 'Grade A',
            icon: Icons.verified,
            color: Colors.purple,
            onTap: () {
              // TODO: Navigate to quality details
            },
          ),
        ],
      ),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _DashboardCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: color,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
