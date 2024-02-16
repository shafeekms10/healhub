import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healhub/Screens/Counsellor/home_screen_counsellor.dart';
import 'package:healhub/Screens/about.dart';
import 'package:healhub/Screens/contact.dart';
import 'package:healhub/Screens/Client/home_screen.dart';
import 'package:healhub/Services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class SidemenuCounsellor extends StatefulWidget {
  const SidemenuCounsellor({Key? key}) : super(key: key);

  @override
  State<SidemenuCounsellor> createState() => _SidemenuCounsellorState();
}

class _SidemenuCounsellorState extends State<SidemenuCounsellor> {
  late String name;
  late String email;

  @override
  void initState() {
    super.initState();
    // Initialize user details
    email = FirebaseAuth.instance.currentUser!.email ?? "user@example.com";
  }

  void signOut() {
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) => Drawer(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildHeader(context),
          buildMenuItems(context),
        ],
      ),
    ),
  );

  Widget buildHeader(BuildContext context) => Material(
    color: Colors.teal.shade400,
    child: Container(
      padding: EdgeInsets.only(
        top: 24 + MediaQuery.of(context).padding.top,
        bottom: 24,
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 52,
            backgroundImage: AssetImage('assets/images/profile.png'),
          ),
          const SizedBox(height: 12),
          const Text(
            'David Johnson',
            style: TextStyle(fontSize: 28, color: Colors.white),
          ),
          Text(
            email,
            style: const TextStyle(fontSize: 14, color: Colors.white),
          ),
        ],
      ),
    ),
  );

  Widget buildMenuItems(BuildContext context) => Container(
    padding: const EdgeInsets.all(30),
    child: Wrap(
      runSpacing: 18,
      children: [
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text('Home'),
          onTap: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomescreenCounsellor(),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.collections_bookmark_outlined),
          title: const Text('About Us'),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AboutUsPage(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.call),
          title: const Text('Contact Us'),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ContactUsPage(),
              ),
            );
          },
        ),
        const Divider(color: Colors.black54),
        ListTile(
          leading: const Icon(Icons.login_outlined),
          title: const Text('Log Out'),
          onTap: signOut,
        ),
      ],
    ),
  );
}
