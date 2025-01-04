import 'package:flutter/material.dart';
import 'package:program/page/auth/chat.dart';
import 'package:program/page/auth/groupchat.dart';
import 'package:program/page/auth/nutritionistprofile.dart'; // Import halaman NutritionistProfile
import 'package:program/page/auth/profile.dart';
import 'package:program/page/auth/setting.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  _AppointmentsScreenState createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  int _selectedIndex = 2; // Index untuk BottomNavigationBar
  int _tabIndex = 0; // Menyimpan tab yang aktif (0 = Upcoming, 1 = Past)

  // Fungsi untuk menangani tab
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigasi berdasarkan indeks
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsPage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Groupchat()),
        );
        break;
      case 2:
        // Tetap di halaman Home, tidak perlu navigasi
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatScreen()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
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
        title: const Text(
          "",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add more space to move everything down
          const SizedBox(height: 10), // Adjust this to move content lower

          // Teks "Appointments" dengan center alignment
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Appointments",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 40),

          // Button "Upcoming" dan "Past" sebagai tab
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center both buttons
              children: [
                _buildTabButton("Upcoming", 0),
                const SizedBox(width: 50), // Space between buttons
                _buildTabButton("Past", 1),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Tanggal "20 Aug, 2023"
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "20 Aug, 2023",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),

          // Konten janji temu berdasarkan tab
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                if (_tabIndex == 0) ...[
                  // Tampilkan janji temu upcoming
                  _buildAppointmentCard(),
                  _buildAppointmentCard(),
                  _buildAppointmentCard(),
                ] else ...[
                  // Tampilkan janji temu yang sudah lewat (Past)
                  _buildAppointmentCard(),
                  _buildAppointmentCard(),
                ],
              ],
            ),
          ),
        ],
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
        onTap: _onItemTapped, // Update onTap to handle navigation
      ),
    );
  }

  // Widget untuk membuat tombol tab "Upcoming" dan "Past"
  Widget _buildTabButton(String label, int index) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: _tabIndex == index
            ? Colors.black
            : Colors.grey, // Use backgroundColor
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {
        setState(() {
          _tabIndex = index;
        });
      },
      child: Text(
        label,
        style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white), // Text color
      ),
    );
  }

  // Widget untuk membangun card janji temu
  Widget _buildAppointmentCard() {
    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman NutritionistProfileScreen saat card diklik
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NutritionistProfileScreen()),
        );
      },
      child: Card(
        color: const Color.fromRGBO(85, 220, 85, 0.498),
        margin: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/profill.png'),
                radius: 25,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Mr. Ivan",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const Text("Heart Patient"),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "5:30pm to 6:30pm",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
