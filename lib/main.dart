import 'package:flutter/material.dart';

void main() => runApp(const KKCoinsApp());

class KKCoinsApp extends StatelessWidget {
  const KKCoinsApp({super.key});

  static const navy = Color(0xFF102B5C);
  static const blue = Color(0xFF174A9C);
  static const gold = Color(0xFFD8A72E);
  static const pale = Color(0xFFF4F7FC);

  @override
  Widget build(BuildContext context) => MaterialApp(
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
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
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
        home: const MainNavigation(),
      );
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeScreen(
        onBook: () => setState(() => selectedIndex = 1),
        onTrack: () => setState(() => selectedIndex = 2),
      ),
      const BookingScreen(),
      const TrackingScreen(),
      const AccountScreen(),
    ];
    return Scaffold(
      body: SafeArea(child: IndexedStack(index: selectedIndex, children: pages)),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) => setState(() => selectedIndex = index),
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.add_box_outlined),
              selectedIcon: Icon(Icons.add_box),
              label: 'Send'),
          NavigationDestination(
              icon: Icon(Icons.location_searching), label: 'Track'),
          NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: 'Account'),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.onBook, required this.onTrack});
  final VoidCallback onBook;
  final VoidCallback onTrack;

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
        children: [
          Row(children: [
            const BrandMark(size: 48),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('K.K COINS',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.1,
                            color: KKCoinsApp.navy)),
                    Text('GLOBAL CONNECT',
                        style: TextStyle(
                            fontSize: 11,
                            letterSpacing: 1.4,
                            color: KKCoinsApp.blue)),
                  ]),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none_rounded,
                    color: KKCoinsApp.navy)),
          ]),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: const LinearGradient(
                  colors: [KKCoinsApp.navy, KKCoinsApp.blue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.14),
                        borderRadius: BorderRadius.circular(30)),
                    child: const Text('YOUR GLOBAL DELIVERY PARTNER',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            letterSpacing: 1.1,
                            fontWeight: FontWeight.w700)),
                  ),
                  const SizedBox(height: 18),
                  const Text('Send with confidence.\nDeliver worldwide.',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          height: 1.18,
                          fontWeight: FontWeight.w800)),
                  const SizedBox(height: 10),
                  Text(
                      'Luggage, parcels and business goods—connected from Nigeria to the world.',
                      style: TextStyle(
                          color: Colors.white.withOpacity(.82), height: 1.45)),
                  const SizedBox(height: 20),
                  FilledButton.icon(
                    onPressed: onBook,
                    icon: const Icon(Icons.arrow_forward_rounded),
                    label: const Text('Book a delivery'),
                    style: FilledButton.styleFrom(
                        backgroundColor: KKCoinsApp.gold,
                        foregroundColor: KKCoinsApp.navy,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 17, vertical: 14)),
                  ),
                ]),
          ),
          const SizedBox(height: 25),
          const SectionHeading(
              title: 'What do you need today?',
              subtitle: 'Simple logistics, all in one place'),
          const SizedBox(height: 13),
          Row(children: [
            Expanded(
                child: ServiceCard(
                    icon: Icons.local_shipping_outlined,
                    title: 'Send a parcel',
                    color: KKCoinsApp.blue,
                    onTap: onBook)),
            const SizedBox(width: 12),
            Expanded(
                child: ServiceCard(
                    icon: Icons.luggage_outlined,
                    title: 'Send luggage',
                    color: KKCoinsApp.gold,
                    onTap: onBook)),
          ]),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(
                child: ServiceCard(
                    icon: Icons.storefront_outlined,
                    title: 'Business delivery',
                    color: const Color(0xFF27836E),
                    onTap: onBook)),
            const SizedBox(width: 12),
            Expanded(
                child: ServiceCard(
                    icon: Icons.travel_explore_outlined,
                    title: 'Track shipment',
                    color: const Color(0xFF7755B5),
                    onTap: onTrack)),
          ]),
          const SizedBox(height: 24),
          const SectionHeading(
              title: 'Your recent shipment', subtitle: 'Sample preview'),
          const SizedBox(height: 12),
          Card(
            elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18)),
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Row(children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                      color: Color(0xFFEAF1FC),
                      borderRadius: BorderRadius.all(Radius.circular(14))),
                  child: SizedBox(
                      width: 46,
                      height: 46,
                      child: Icon(Icons.inventory_2_outlined,
                          color: KKCoinsApp.blue)),
                ),
                SizedBox(width: 13),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text('Lagos → Abuja',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: KKCoinsApp.navy)),
                      SizedBox(height: 4),
                      Text('KKCG-2048 • In transit',
                          style: TextStyle(color: Colors.black54, fontSize: 12)),
                    ])),
                Icon(Icons.chevron_right, color: Colors.black45),
              ]),
            ),
          ),
        ],
      );
}

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});
  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final formKey = GlobalKey<FormState>();
  String service = 'Parcel';

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const ScreenTitle(
              title: 'Book a delivery',
              subtitle: 'Tell us where your shipment needs to go.'),
          const SizedBox(height: 22),
          Form(
            key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FieldLabel('Shipment type'),
                  DropdownButtonFormField<String>(
                    value: service,
                    decoration: const InputDecoration(),
                    items: const ['Parcel', 'Luggage', 'Business goods']
                        .map((item) => DropdownMenuItem(
                            value: item, child: Text(item)))
                        .toList(),
                    onChanged: (value) =>
                        setState(() => service = value ?? 'Parcel'),
                  ),
                  const SizedBox(height: 17),
                  const FieldLabel('Pickup location'),
                  TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'City, area or full address',
                          prefixIcon: Icon(Icons.trip_origin)),
                      validator: requiredField),
                  const SizedBox(height: 17),
                  const FieldLabel('Delivery destination'),
                  TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'City, area or full address',
                          prefixIcon: Icon(Icons.location_on_outlined)),
                      validator: requiredField),
                  const SizedBox(height: 17),
                  const FieldLabel('Shipment details'),
                  TextFormField(
                      maxLines: 3,
                      decoration: const InputDecoration(
                          hintText:
                              'Describe size, weight and any special handling needs'),
                      validator: requiredField),
                  const SizedBox(height: 22),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'Form validated. Connect a backend to submit real bookings.')),
                          );
                        }
                      },
                      style: FilledButton.styleFrom(
                          padding: const EdgeInsets.all(16),
                          backgroundColor: KKCoinsApp.blue),
                      child: const Text('Continue to estimate'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text('No payment is collected in this prototype.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54, fontSize: 12)),
                ]),
          ),
        ],
      );
}

String? requiredField(String? value) =>
    (value == null || value.trim().isEmpty) ? 'Please fill in this field' : null;

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({super.key});
  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  final controller = TextEditingController();
  bool searched = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const ScreenTitle(
              title: 'Track a shipment',
              subtitle: 'Stay updated from pickup to delivery.'),
          const SizedBox(height: 23),
          const FieldLabel('Tracking number'),
          Row(children: [
            Expanded(
                child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                        hintText: 'e.g. KKCG-2048',
                        prefixIcon: Icon(Icons.qr_code_2)))),
            const SizedBox(width: 10),
            FilledButton(
                onPressed: () => setState(
                    () => searched = controller.text.trim().isNotEmpty),
                style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 17, horizontal: 17)),
                child: const Text('Track')),
          ]),
          if (searched) ...[
            const SizedBox(height: 24),
            Card(
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(controller.text.trim(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              color: KKCoinsApp.navy)),
                      const SizedBox(height: 7),
                      const Text('Lagos, Nigeria  →  Abuja, Nigeria',
                          style: TextStyle(color: Colors.black54)),
                      const SizedBox(height: 22),
                      const StatusStep(
                          title: 'Booking confirmed',
                          subtitle: 'Shipment request received',
                          complete: true),
                      const StatusStep(
                          title: 'Picked up',
                          subtitle: 'Collected from sender',
                          complete: true),
                      const StatusStep(
                          title: 'In transit',
                          subtitle: 'On the way to destination',
                          complete: false),
                      const StatusStep(
                          title: 'Delivered',
                          subtitle: 'Awaiting delivery',
                          complete: false,
                          last: true),
                    ]),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
                'Demo status only. Live tracking requires a connected logistics backend.',
                style: TextStyle(color: Colors.black54, fontSize: 12)),
          ] else ...[
            const SizedBox(height: 45),
            const Icon(Icons.route_outlined,
                size: 74, color: Color(0xFFB8C6DA)),
            const SizedBox(height: 14),
            const Text('Your delivery journey,\nall in one view.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: KKCoinsApp.navy)),
            const SizedBox(height: 8),
            const Text(
                'Enter a tracking number above to view shipment progress.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54)),
          ],
        ],
      );
}

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) => ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const ScreenTitle(
              title: 'Your account',
              subtitle: 'Manage your profile and preferences.'),
          const SizedBox(height: 22),
          Card(
            elevation: 0,
            color: Colors.white,
            child: ListTile(
              leading: const CircleAvatar(
                  backgroundColor: Color(0xFFEAF1FC),
                  child: Icon(Icons.person_outline, color: KKCoinsApp.blue)),
              title: const Text('Guest user'),
              subtitle: const Text('Sign in to manage deliveries'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text(
                          'Authentication will be connected in a future step.'))),
            ),
          ),
          const SizedBox(height: 12),
          const AccountOption(
              icon: Icons.receipt_long_outlined, title: 'My deliveries'),
          const AccountOption(
              icon: Icons.support_agent_outlined, title: 'Help and support'),
          const AccountOption(
              icon: Icons.privacy_tip_outlined, title: 'Privacy and terms'),
          const SizedBox(height: 16),
          const Text('K.K Coins Global Connect • App foundation v0.1',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black45, fontSize: 12)),
        ],
      );
}

class BrandMark extends StatelessWidget {
  const BrandMark({super.key, this.size = 46});
  final double size;

  @override
  Widget build(BuildContext context) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            color: KKCoinsApp.navy,
            borderRadius: BorderRadius.circular(size * .31)),
        child: Center(
          child: Stack(alignment: Alignment.center, children: [
            Icon(Icons.public, color: Colors.white, size: size * .62),
            Positioned(
                right: size * .04,
                bottom: size * .04,
                child: Icon(Icons.local_shipping,
                    color: KKCoinsApp.gold, size: size * .36)),
          ]),
        ),
      );
}

class SectionHeading extends StatelessWidget {
  const SectionHeading({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: KKCoinsApp.navy)),
          const SizedBox(height: 4),
          Text(subtitle,
              style: const TextStyle(fontSize: 12, color: Colors.black54)),
        ],
      );
}

class ServiceCard extends StatelessWidget {
  const ServiceCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.color,
      required this.onTap});
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(18)),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                        color: color.withOpacity(.12),
                        borderRadius: BorderRadius.circular(13)),
                    child: Icon(icon, color: color)),
                const SizedBox(height: 15),
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: KKCoinsApp.navy)),
              ]),
        ),
      );
}

class ScreenTitle extends StatelessWidget {
  const ScreenTitle({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: KKCoinsApp.navy)),
          const SizedBox(height: 6),
          Text(subtitle, style: const TextStyle(color: Colors.black54)),
        ],
      );
}

class FieldLabel extends StatelessWidget {
  const FieldLabel(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(text,
            style: const TextStyle(
                fontWeight: FontWeight.w700, color: KKCoinsApp.navy)),
      );
}

class StatusStep extends StatelessWidget {
  const StatusStep(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.complete,
      this.last = false});
  final String title;
  final String subtitle;
  final bool complete;
  final bool last;

  @override
  Widget build(BuildContext context) => IntrinsicHeight(
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          SizedBox(
            width: 26,
            child: Column(children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: complete
                        ? const Color(0xFFE8F5EF)
                        : const Color(0xFFF0F2F5),
                    shape: BoxShape.circle),
                child: Icon(complete ? Icons.check : Icons.circle,
                    size: complete ? 13 : 7,
                    color: complete
                        ? const Color(0xFF27836E)
                        : Colors.black26),
              ),
              if (!last)
                Expanded(
                    child: Container(
                        width: 2,
                        color: complete
                            ? const Color(0xFFB9DCCB)
                            : const Color(0xFFE1E5EA))),
            ]),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: complete ? KKCoinsApp.navy : Colors.black54)),
                    const SizedBox(height: 3),
                    Text(subtitle,
                        style: const TextStyle(
                            fontSize: 12, color: Colors.black45)),
                  ]),
            ),
          ),
        ]),
      );
}

class AccountOption extends StatelessWidget {
  const AccountOption({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) => Card(
        elevation: 0,
        color: Colors.white,
        child: ListTile(
            leading: Icon(icon, color: KKCoinsApp.blue),
            title: Text(title),
            trailing: const Icon(Icons.chevron_right, color: Colors.black45),
            onTap: () {}),
      );
}
