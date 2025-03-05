import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';
import 'screens/monitoring_screen.dart';
import 'screens/marketplace_screen.dart';
import 'services/navigation_service.dart';

void main() {
  runApp(const BioCoalTechApp());
}

class BioCoalTechApp extends StatelessWidget {
  const BioCoalTechApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BioCoalTech India',
      navigatorKey: NavigationService.navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF15803d),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        AppRoutes.dashboard: (context) => const DashboardScreen(),
        AppRoutes.monitoring: (context) => const MonitoringScreen(),
        AppRoutes.marketplace: (context) => const MarketplaceScreen(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const MonitoringScreen(),
    const MarketplaceScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.monitor),
            label: 'Monitoring',
          ),
          NavigationDestination(
            icon: Icon(Icons.store),
            label: 'Marketplace',
          ),
        ],
      ),
      drawer: NavigationDrawer(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Color(0xFF15803d),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'BioCoalTech India',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: () {
              setState(() => _currentIndex = 0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.monitor),
            title: const Text('Process Monitoring'),
            onTap: () {
              setState(() => _currentIndex = 1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.store),
            title: const Text('Marketplace'),
            onTap: () {
              setState(() => _currentIndex = 2);
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              // TODO: Navigate to Profile
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // TODO: Navigate to Settings
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help & Support'),
            onTap: () {
              // TODO: Navigate to Help & Support
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // TODO: Handle logout
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
