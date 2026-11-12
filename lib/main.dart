import 'package:flutter/material.dart';

void main() => runApp(const KKCoinsGlobalConnectApp());

class KKCoinsGlobalConnectApp extends StatelessWidget {
  const KKCoinsGlobalConnectApp({super.key});

  static const navy = Color(0xFF102B5C);
  static const blue = Color(0xFF174A9C);
  static const gold = Color(0xFFD8A72E);
  static const pale = Color(0xFFF4F7FC);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'K.K Coins Global Connect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: pale,
        colorScheme: ColorScheme.fromSeed(seedColor: blue).copyWith(
          primary: blue,
          secondary: gold,
          surface: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: pale,
          foregroundColor: navy,
          elevation: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
          ),
        ),
      ),
      home: const AppEntry(),
    );
  }
}

class AppEntry extends StatefulWidget {
  const AppEntry({super.key});

  @override
  State<AppEntry> createState() => _AppEntryState();
}

class _AppEntryState extends State<AppEntry> {
  bool isLoggedIn = false;
  bool isOwnerPortal = false;
  String currentUserName = 'Customer';

  final List<Map<String, dynamic>> demoBookings = [
    {'id': 'KKCG-2048', 'route': 'Lagos → Abuja', 'status': 'In transit', 'amount': '₦18,500'},
    {'id': 'KKCG-2051', 'route': 'Abuja → Ibadan', 'status': 'Pending pickup', 'amount': '₦12,200'},
    {'id': 'KKCG-2058', 'route': 'Lagos → Accra', 'status': 'Approved', 'amount': '₦42,100'},
  ];

  final List<Map<String, dynamic>> demoTransfers = [
    {'customer': 'Chinedu A.', 'amount': '₦18,500', 'method': 'Direct transfer', 'status': 'Pending approval'},
    {'customer': 'Grace O.', 'amount': '₦26,000', 'method': 'Direct transfer', 'status': 'Approved'},
    {'customer': 'Musa T.', 'amount': '₦32,700', 'method': 'Direct transfer', 'status': 'Awaiting confirmation'},
  ];

  void loginCustomer(String fullName, String email, String password) {
    if (fullName.trim().isEmpty || email.trim().isEmpty || password.trim().isEmpty) {
      return;
    }
    setState(() {
      currentUserName = fullName.trim();
      isLoggedIn = true;
      isOwnerPortal = false;
    });
  }

  void loginOwner() {
    setState(() {
      currentUserName = 'CEO Owner';
      isLoggedIn = true;
      isOwnerPortal = true;
    });
  }

  void logout() {
    setState(() {
      isLoggedIn = false;
      isOwnerPortal = false;
      currentUserName = 'Customer';
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoggedIn) {
      return WelcomeScreen(
        onCustomerSignup: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => SignUpScreen(onSubmit: loginCustomer),
          ),
        ),
        onCustomerLogin: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => LoginScreen(onLogin: (email, password) {
              loginCustomer('Customer User', email, password);
            }),
          ),
        ),
        onOwnerLogin: loginOwner,
      );
    }

    if (isOwnerPortal) {
      return OwnerPortalScreen(
        username: currentUserName,
        transfers: demoTransfers,
        onLogout: logout,
      );
    }

    return CustomerHomeScreen(
      username: currentUserName,
      bookings: demoBookings,
      onLogout: logout,
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    super.key,
    required this.onCustomerSignup,
    required this.onCustomerLogin,
    required this.onOwnerLogin,
  });

  final VoidCallback onCustomerSignup;
  final VoidCallback onCustomerLogin;
  final VoidCallback onOwnerLogin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KKCoinsGlobalConnectApp.pale,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Row(
                children: const [
                  BrandMark(size: 48),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('K.K COINS',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1.1,
                                color: KKCoinsGlobalConnectApp.navy)),
                        Text('GLOBAL CONNECT',
                            style: TextStyle(
                                fontSize: 11,
                                letterSpacing: 1.4,
                                color: KKCoinsGlobalConnectApp.blue)),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: const LinearGradient(
                    colors: [KKCoinsGlobalConnectApp.navy, KKCoinsGlobalConnectApp.blue],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.14),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Text(
                        'YOUR GLOBAL DELIVERY PARTNER',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          letterSpacing: 1.1,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      'Send with confidence. Deliver worldwide.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        height: 1.15,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Luggage, parcels, and business goods supported by a trusted delivery network.',
                      style: TextStyle(
                        color: Colors.white.withOpacity(.82),
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              const Text(
                'Access the app',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: KKCoinsGlobalConnectApp.navy,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: onCustomerSignup,
                  style: FilledButton.styleFrom(
                    backgroundColor: KKCoinsGlobalConnectApp.blue,
                    padding: const EdgeInsets.all(16),
                  ),
                  child: const Text('Create account'),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: onCustomerLogin,
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    side: const BorderSide(color: KKCoinsGlobalConnectApp.blue),
                  ),
                  child: const Text('Login'),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: FilledButton.tonal(
                  onPressed: onOwnerLogin,
                  style: FilledButton.styleFrom(
                    backgroundColor: KKCoinsGlobalConnectApp.gold,
                    foregroundColor: KKCoinsGlobalConnectApp.navy,
                    padding: const EdgeInsets.all(16),
                  ),
                  child: const Text('CEO / admin portal'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key, required this.onSubmit});
  final void Function(String fullName, String email, String password) onSubmit;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create account')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Create your K.K Coins account',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: KKCoinsGlobalConnectApp.navy,
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Full name',
              prefixIcon: Icon(Icons.person_outline),
            ),
          ),
          const SizedBox(height: 14),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Email address',
              prefixIcon: Icon(Icons.email_outlined),
            ),
          ),
          const SizedBox(height: 14),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock_outline),
            ),
          ),
          const SizedBox(height: 22),
          FilledButton(
            onPressed: () {
              widget.onSubmit(
                nameController.text,
                emailController.text,
                passwordController.text,
              );
              Navigator.of(context).pop();
            },
            style: FilledButton.styleFrom(
              backgroundColor: KKCoinsGlobalConnectApp.blue,
              padding: const EdgeInsets.all(16),
            ),
            child: const Text('Create account'),
          ),
        ],
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.onLogin});
  final void Function(String email, String password) onLogin;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Welcome back',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: KKCoinsGlobalConnectApp.navy,
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Email address',
              prefixIcon: Icon(Icons.email_outlined),
            ),
          ),
          const SizedBox(height: 14),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock_outline),
            ),
          ),
          const SizedBox(height: 22),
          FilledButton(
            onPressed: () {
              widget.onLogin(emailController.text, passwordController.text);
              Navigator.of(context).pop();
            },
            style: FilledButton.styleFrom(
              backgroundColor: KKCoinsGlobalConnectApp.blue,
              padding: const EdgeInsets.all(16),
            ),
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}

class CustomerHomeScreen extends StatelessWidget {
  const CustomerHomeScreen({
    super.key,
    required this.username,
    required this.bookings,
    required this.onLogout,
  });

  final String username;
  final List<Map<String, dynamic>> bookings;
  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello, $username'),
        actions: [
          IconButton(onPressed: onLogout, icon: const Icon(Icons.logout_rounded)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [KKCoinsGlobalConnectApp.navy, KKCoinsGlobalConnectApp.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Available balance', style: TextStyle(color: Colors.white70)),
                const SizedBox(height: 10),
                const Text('₦250,000', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w800)),
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const DirectTransferScreen(),
                    ),
                  ),
                  icon: const Icon(Icons.add_circle_outline),
                  style: FilledButton.styleFrom(
                    backgroundColor: KKCoinsGlobalConnectApp.gold,
                    foregroundColor: KKCoinsGlobalConnectApp.navy,
                  ),
                  label: const Text('Book a delivery'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Recent shipments',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: KKCoinsGlobalConnectApp.navy,
            ),
          ),
          const SizedBox(height: 12),
          ...bookings.map((item) => Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAF1FC),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.local_shipping_outlined, color: KKCoinsGlobalConnectApp.blue),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item['id'], style: const TextStyle(fontWeight: FontWeight.w800, color: KKCoinsGlobalConnectApp.navy)),
                          const SizedBox(height: 4),
                          Text(item['route'], style: const TextStyle(color: Colors.black54)),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(item['amount'], style: const TextStyle(fontWeight: FontWeight.w700, color: KKCoinsGlobalConnectApp.navy)),
                        const SizedBox(height: 6),
                        Text(item['status'], style: const TextStyle(fontSize: 12, color: Colors.black54)),
                      ],
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class DirectTransferScreen extends StatelessWidget {
  const DirectTransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Direct transfer')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Pay by direct transfer',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: KKCoinsGlobalConnectApp.navy,
            ),
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Bank name', style: TextStyle(color: Colors.black54)),
                SizedBox(height: 6),
                Text('K.K Coins Global Connect', style: TextStyle(fontWeight: FontWeight.w800, color: KKCoinsGlobalConnectApp.navy)),
                SizedBox(height: 18),
                Text('Account number', style: TextStyle(color: Colors.black54)),
                SizedBox(height: 6),
                Text('0123456789', style: TextStyle(fontWeight: FontWeight.w800, color: KKCoinsGlobalConnectApp.navy)),
                SizedBox(height: 18),
                Text('Amount due', style: TextStyle(color: Colors.black54)),
                SizedBox(height: 6),
                Text('₦18,500', style: TextStyle(fontWeight: FontWeight.w800, color: KKCoinsGlobalConnectApp.navy)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text('Transfer proof', style: TextStyle(fontWeight: FontWeight.w700, color: KKCoinsGlobalConnectApp.navy)),
          const SizedBox(height: 12),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Reference or narration',
              prefixIcon: Icon(Icons.receipt_long_outlined),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: 'Upload proof details',
              prefixIcon: Icon(Icons.note_alt_outlined),
            ),
          ),
          const SizedBox(height: 18),
          FilledButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Transfer request submitted. Owner approval is required.')),
              );
            },
            style: FilledButton.styleFrom(
              backgroundColor: KKCoinsGlobalConnectApp.blue,
              padding: const EdgeInsets.all(16),
            ),
            child: const Text('Submit proof'),
          ),
        ],
      ),
    );
  }
}

class OwnerPortalScreen extends StatelessWidget {
  const OwnerPortalScreen({
    super.key,
    required this.username,
    required this.transfers,
    required this.onLogout,
  });

  final String username;
  final List<Map<String, dynamic>> transfers;
  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$username • CEO Portal'),
        actions: [
          IconButton(onPressed: onLogout, icon: const Icon(Icons.logout_rounded)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            children: [
              Expanded(
                child: SummaryCard(label: 'Total revenue', value: '₦1.2M', color: KKCoinsGlobalConnectApp.navy),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SummaryCard(label: 'Active users', value: '1,426', color: KKCoinsGlobalConnectApp.blue),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: SummaryCard(label: 'Transfers', value: '17', color: KKCoinsGlobalConnectApp.gold),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SummaryCard(label: 'Pending', value: '6', color: const Color(0xFF27836E)),
              ),
            ],
          ),
          const SizedBox(height: 26),
          const Text('Direct transfer approvals', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: KKCoinsGlobalConnectApp.navy)),
          const SizedBox(height: 12),
          ...transfers.map((transfer) => Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(transfer['customer'], style: const TextStyle(fontWeight: FontWeight.w700, color: KKCoinsGlobalConnectApp.navy)),
                        ),
                        Text(transfer['amount'], style: const TextStyle(fontWeight: FontWeight.w800, color: KKCoinsGlobalConnectApp.blue)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(transfer['method'], style: const TextStyle(color: Colors.black54)),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEAF1FC),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(transfer['status'], style: const TextStyle(fontSize: 12, color: KKCoinsGlobalConnectApp.navy)),
                        ),
                        const Spacer(),
                        TextButton(onPressed: () {}, child: const Text('Approve')),
                      ],
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    super.key,
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.white70)),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800)),
        ],
      ),
    );
  }
}

class BrandMark extends StatelessWidget {
  const BrandMark({super.key, this.size = 46});
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: KKCoinsGlobalConnectApp.navy,
        borderRadius: BorderRadius.circular(size * .31),
      ),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.public, color: Colors.white, size: size * .62),
            Positioned(
              right: size * .04,
              bottom: size * .04,
              child: Icon(Icons.local_shipping, color: KKCoinsGlobalConnectApp.gold, size: size * .36),
            ),
          ],
        ),
      ),
    );
  }
}
