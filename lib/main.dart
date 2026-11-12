import 'package:flutter/material.dart';

void main() {
  runApp(const KkCoinsGlobalConnectApp());
}

class KkCoinsGlobalConnectApp extends StatelessWidget {
  const KkCoinsGlobalConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'K.K Coins Global Connect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF176B45),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F9F7),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      home: const AppShell(),
    );
  }
}

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      const HomePage(),
      const ShipmentsPage(),
      const AccountPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('K.K Coins Global Connect'),
        centerTitle: false,
      ),
      body: SafeArea(child: pages[_selectedIndex]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => setState(() => _selectedIndex = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.inventory_2_outlined), label: 'Shipments'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'Account'),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.public, color: Colors.white, size: 34),
              SizedBox(height: 18),
              Text(
                'Connect globally.',
                style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Manage your shipment requests and stay up to date.',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text('Quick actions', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        const _InfoTile(
          icon: Icons.add_box_outlined,
          title: 'Request a shipment',
          subtitle: 'Start a request and provide route details.',
        ),
        const _InfoTile(
          icon: Icons.track_changes_outlined,
          title: 'Track a shipment',
          subtitle: 'View updates for your submitted requests.',
        ),
        const SizedBox(height: 20),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.info_outline, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    'Prototype preview. No shipment, payment, or account data is submitted or verified in this build.',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ShipmentsPage extends StatelessWidget {
  const ShipmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text('Your shipments', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 12),
        const Card(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Icon(Icons.inventory_2_outlined, size: 42),
                SizedBox(height: 12),
                Text('No shipments yet', style: TextStyle(fontWeight: FontWeight.w600)),
                SizedBox(height: 6),
                Text('Shipment requests will appear here after account and backend setup.'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        const _InfoTile(
          icon: Icons.verified_user_outlined,
          title: 'Payment safety',
          subtitle: 'A receipt or transfer reference is not proof of settled funds. The merchant must verify payment independently.',
        ),
      ],
    );
  }
}

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text('Account', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 12),
        const _InfoTile(
          icon: Icons.lock_outline,
          title: 'Sign-in not configured',
          subtitle: 'Firebase Authentication must be configured before real customer accounts can be used.',
        ),
        const _InfoTile(
          icon: Icons.admin_panel_settings_outlined,
          title: 'Owner access is restricted',
          subtitle: 'Admin functions are intentionally unavailable in this prototype. Owner access must be verified by a trusted backend.',
        ),
        const SizedBox(height: 16),
        const Text(
          'Do not enter payment credentials, bank PINs, or passwords into this preview.',
          style: TextStyle(color: Colors.black54),
        ),
      ],
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({required this.icon, required this.title, required this.subtitle});

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
        title: Text(title),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(subtitle),
        ),
      ),
    );
  }
}
