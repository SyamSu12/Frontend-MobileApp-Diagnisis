import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PossibleDiseaseScreen(),
    );
  }
}

class PossibleDiseaseScreen extends StatelessWidget {
  const PossibleDiseaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        elevation: 0,
        toolbarHeight: 140,
        flexibleSpace: const Padding(
          padding: EdgeInsets.fromLTRB(16, 60, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
              SizedBox(height: 8),
              Text(
                'Welcome Alexa',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Possible Disease',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const DiseaseCard(
              title: 'Iron Deficiency Anemia',
              description:
                  'A lack of iron leads to low hemoglobin production, causing fatigue, paleness, and shortness of breath. It is often due to insufficient iron intake or blood loss.',
            ),
            const SizedBox(height: 10),
            const DiseaseCard(
              title: 'Folate Deficiency Anemia',
              description:
                  'Insufficient folic acid reduces red blood cell production, causing fatigue and shortness of breath. Common in pregnant women and those with poor diets or absorption problems.',
            ),
            const SizedBox(height: 10),
            const DiseaseCard(
              title: 'Anemia of Chronic Disease',
              description:
                  'Chronic illness or inflammation interferes with iron usage, leading to low hemoglobin levels. Symptoms include fatigue and weakness, despite normal or elevated iron stores.',
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                  child: const Text(
                    'Contact Nutritionist',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                  child: const Text(
                    'Recommended Drugs',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Container(
              width: 80, // Lebar tombol home
              height: 40, // Tinggi tombol home yang lebih pendek
              decoration: BoxDecoration(
                color: Colors.green[300], // Warna background tombol home
                borderRadius: BorderRadius.circular(10),
              ),
              child:
                  const Icon(Icons.home, size: 24, color: Colors.black), // Ikon Home
            ),
            label: '', // Menghilangkan teks label
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.settings, size: 24, color: Colors.black),
            label: 'Settings',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.message, size: 24, color: Colors.black),
            label: 'Messages',
          ),
          const BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15,
              backgroundImage:
                  AssetImage('assets/images/ivan.png'), // Path gambar profil
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.green[300],
        unselectedItemColor: Colors.grey,
        iconSize: 30,
        onTap: (index) {},
      ),
    );
  }
}

class DiseaseCard extends StatelessWidget {
  final String title;
  final String description;

  const DiseaseCard({super.key, 
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
