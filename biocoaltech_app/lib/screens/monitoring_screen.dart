import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MonitoringScreen extends StatelessWidget {
  const MonitoringScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Process Monitoring'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Temperature Chart
            _ChartCard(
              title: 'Temperature',
              subtitle: 'Last 24 hours',
              chart: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        const FlSpot(0, 180),
                        const FlSpot(2, 185),
                        const FlSpot(4, 175),
                        const FlSpot(6, 190),
                        const FlSpot(8, 180),
                        const FlSpot(10, 185),
                        const FlSpot(12, 180),
                      ],
                      isCurved: true,
                      color: Colors.red,
                      barWidth: 3,
                      dotData: FlDotData(show: false),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Process Parameters
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current Parameters',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    const _ParameterRow(
                      icon: Icons.thermostat,
                      label: 'Temperature',
                      value: '180°C',
                      status: 'Normal',
                      statusColor: Colors.green,
                    ),
                    const Divider(),
                    const _ParameterRow(
                      icon: Icons.water_drop,
                      label: 'Moisture',
                      value: '12%',
                      status: 'Normal',
                      statusColor: Colors.green,
                    ),
                    const Divider(),
                    const _ParameterRow(
                      icon: Icons.speed,
                      label: 'Pressure',
                      value: '2.5 bar',
                      status: 'Warning',
                      statusColor: Colors.orange,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Alerts and Notifications
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recent Alerts',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    const _AlertItem(
                      title: 'High Pressure Warning',
                      message: 'Pressure exceeded normal range',
                      time: '5 minutes ago',
                      severity: AlertSeverity.warning,
                    ),
                    const Divider(),
                    const _AlertItem(
                      title: 'Temperature Stable',
                      message: 'Temperature back to normal range',
                      time: '1 hour ago',
                      severity: AlertSeverity.info,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Refresh data
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class _ChartCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget chart;

  const _ChartCard({
    required this.title,
    required this.subtitle,
    required this.chart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: chart,
            ),
          ],
        ),
      ),
    );
  }
}

class _ParameterRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String status;
  final Color statusColor;

  const _ParameterRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: Theme.of(context).textTheme.titleMedium),
                Text(value, style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              style: TextStyle(color: statusColor),
            ),
          ),
        ],
      ),
    );
  }
}

enum AlertSeverity { info, warning, error }

class _AlertItem extends StatelessWidget {
  final String title;
  final String message;
  final String time;
  final AlertSeverity severity;

  const _AlertItem({
    required this.title,
    required this.message,
    required this.time,
    required this.severity,
  });

  Color _getSeverityColor(BuildContext context) {
    switch (severity) {
      case AlertSeverity.info:
        return Colors.blue;
      case AlertSeverity.warning:
        return Colors.orange;
      case AlertSeverity.error:
        return Colors.red;
    }
  }

  IconData _getSeverityIcon() {
    switch (severity) {
      case AlertSeverity.info:
        return Icons.info;
      case AlertSeverity.warning:
        return Icons.warning;
      case AlertSeverity.error:
        return Icons.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            _getSeverityIcon(),
            color: _getSeverityColor(context),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                Text(message, style: Theme.of(context).textTheme.bodyMedium),
                Text(
                  time,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
