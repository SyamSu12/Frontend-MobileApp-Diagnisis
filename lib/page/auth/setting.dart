import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      appBar: AppBar(
        backgroundColor: Colors.white, // Make the AppBar background white
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 8.0), // Menurunkan teks "Setting"
          child: Text(
            'Setting',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40), // Menambahkan jarak setelah AppBar
            Text(
              'Personal Info',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('Your profile'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('History Transaction'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.delete_outline),
              title: const Text('Delete Account'),
              onTap: () {},
            ),
            const Divider(),
            Text(
              'Security',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.lock_outline),
              title: const Text('Change password'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.lock_open_outlined),
              title: const Text('Forgot password'),
              onTap: () {},
            ),
            const Divider(),
            Text(
              'General',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.notifications_outlined),
              title: const Text('Notification'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.language_outlined),
              title: const Text('Languages'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.help_outline),
              title: const Text('Help and Support'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
