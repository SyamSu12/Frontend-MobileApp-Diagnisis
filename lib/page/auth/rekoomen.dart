import 'package:flutter/material.dart';

class Rekoomen extends StatelessWidget {
  const Rekoomen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop(); // This should work correctly
          },
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.black),
                onPressed: () {
                  // Add notification action here
                },
              ),
              Positioned(
                right: 12,
                top: 12,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '2',
                      style: TextStyle(
                          color: Color.fromARGB(255, 142, 140, 140),
                          fontSize: 10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Bagian atas hijau
          Container(
            color: Colors.green[300],
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: const Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/images/ivan.png'), // Make sure the image exists
                  radius: 30,
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Alexa',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Patient',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Bagian bawah putih
          Expanded(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: const [
                  InfoCard(
                    title: 'Mikronutrient',
                    description:
                        'Iron Deficiency Anemia\nA lack of iron leads to low hemoglobin production, causing fatigue, paleness, and shortness of breath. It is often due to insufficient iron intake or blood loss.',
                  ),
                  InfoCard(
                    title: 'Vitamin',
                    description:
                        'Iron Deficiency Anemia\nA lack of iron leads to low hemoglobin production, causing fatigue, paleness, and shortness of breath. It is often due to insufficient iron intake or blood loss.',
                  ),
                  InfoCard(
                    title: 'Protein',
                    description:
                        'Iron Deficiency Anemia\nA lack of iron leads to low hemoglobin production, causing fatigue, paleness, and shortness of breath. It is often due to insufficient iron intake or blood loss.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String description;

  const InfoCard({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.grey[300], // Set the background color to light grey
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black), // Text color set to black
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(
                  fontSize: 14, color: Colors.black), // Text color set to black
            ),
          ],
        ),
      ),
    );
  }
}
