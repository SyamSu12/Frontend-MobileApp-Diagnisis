import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      appBar: AppBar(
        backgroundColor: Colors.white, // Make the AppBar background white
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0), // Menurunkan teks "Setting"
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
            SizedBox(height: 40), // Menambahkan jarak setelah AppBar
            Text(
              'Personal Info',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person_outline),
              title: Text('Your profile'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('History Transaction'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.delete_outline),
              title: Text('Delete Account'),
              onTap: () {},
            ),
            Divider(),
            Text(
              'Security',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            ListTile(
              leading: Icon(Icons.lock_outline),
              title: Text('Change password'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.lock_open_outlined),
              title: Text('Forgot password'),
              onTap: () {},
            ),
            Divider(),
            Text(
              'General',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            ListTile(
              leading: Icon(Icons.notifications_outlined),
              title: Text('Notification'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.language_outlined),
              title: Text('Languages'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text('Help and Support'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
