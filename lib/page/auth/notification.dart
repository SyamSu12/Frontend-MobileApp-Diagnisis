import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotificationsPage(),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.white, // Set background color of the Scaffold to white
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        title: Text(
          'Notifications',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            NotificationCard(
              profileImage: 'assets/images/profill.png',
              name: 'Alex Nutritionist',
              message:
                  'Accept your appointment on your selected date and time.',
              time: '5 min ago',
              hasCloseButton: true,
            ),
            NotificationCard(
              profileImage: 'assets/images/profill.png',
              name: 'Alex Nutritionist',
              message:
                  'Accept your appointment on your selected date and time.',
              time: '1 hour ago',
            ),
            NotificationCard(
              profileImage: 'assets/images/profill.png',
              name: 'Alex Nutritionist',
              message:
                  'Accept your appointment on your selected date and time.',
              time: '3 hours ago',
            ),
            NotificationCard(
              profileImage: 'assets/images/profill.png',
              name: 'Alex Nutritionist',
              message:
                  'Accept your appointment on your selected date and time.',
              time: '6 hours ago',
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String profileImage;
  final String name;
  final String message;
  final String time;
  final bool hasCloseButton;

  const NotificationCard({
    required this.profileImage,
    required this.name,
    required this.message,
    required this.time,
    this.hasCloseButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green[300], // Keeps the card color green
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage(profileImage),
                radius: 27,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    message,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  SizedBox(height: 8),
                  Text(
                    time,
                    style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            if (hasCloseButton)
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {},
                color: Colors.black,
              ),
          ],
        ),
      ),
    );
  }
}
