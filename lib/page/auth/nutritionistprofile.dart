import 'package:flutter/material.dart';
import 'package:program/page/auth/chat.dart';
import 'package:program/page/auth/doctordetail.dart';
import 'package:program/page/auth/groupchat.dart';
import 'package:program/page/auth/profile.dart';
import 'package:program/page/auth/setting.dart';
import 'package:program/page/auth/ulasan.dart';

class NutritionistProfileScreen extends StatefulWidget {
  const NutritionistProfileScreen({super.key});

  @override
  _NutritionistProfileScreenState createState() =>
      _NutritionistProfileScreenState();
}

class _NutritionistProfileScreenState extends State<NutritionistProfileScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigasi berdasarkan indeks
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SettingsPage()), // Navigasi ke SettingsPage
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Groupchat()), // Navigasi ke Groupchat
        );
        break;
      case 2:
        // Tetap di halaman Home, tidak perlu navigasi
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChatScreen()), // Navigasi ke ChatScreen
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProfilePage()), // Navigasi ke DoktorProfile
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text(
            "Nutritionist Profile",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Baris gambar dan teks profil
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gambar profil dalam bentuk persegi panjang
                Container(
                  width: 100,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/ivann.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16), // Jarak antara gambar dan teks
                // Kolom untuk teks profil
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Mr. Ivan",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      "Gastro Specialist",
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        // Navigasi ke halaman ulasan
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NutritionistListScreen()),
                        );
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber),
                          Text(
                            "4.8 ",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          Text(
                            "(23 reviews)",
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 80),
            const Text(
              "Contact Details",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            _buildContactDetail(Icons.phone, "+6281245873498"),
            _buildContactDetail(Icons.email, "alex@gmail.com"),
            _buildContactDetail(Icons.location_on,
                "k-74,saraswati vihar,ph-1\nrohini,delhi-110085"),
            const SizedBox(height: 50),
            // Membuat tombol "BOOK APPOINTMENT" rata tengah
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman DoctorDetailsPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NutritionistDetailsPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: const BorderSide(color: Colors.green, width: 4),
                  ),
                ),
                child: const Text(
                  "BOOK APPOINTMENT",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, size: 30, color: Colors.black),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group, size: 30, color: Colors.black),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat, size: 30, color: Colors.black),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30, color: Colors.black),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildContactDetail(IconData icon, String detail) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.black),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              detail,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
