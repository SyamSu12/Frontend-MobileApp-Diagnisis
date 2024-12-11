import 'package:flutter/material.dart';
import 'package:program/page/auth/chat.dart';
import 'package:program/page/auth/doctorprofile.dart';
import 'package:program/page/auth/groupchat.dart';
import 'package:program/page/auth/profiledoktor.dart';
import 'package:program/page/auth/setting.dart'; // Import halaman NutritionistProfile

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  int _selectedIndex = 2; // Index untuk BottomNavigationBar
  int _tabIndex = 0; // Menyimpan tab yang aktif (0 = Upcoming, 1 = Past)

  // Fungsi untuk menangani tab
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Jika tab 2 (Home) dipilih, kita tidak perlu navigasi lebih jauh
      if (_selectedIndex == 2) {
        // Tetap di halaman Home, tidak perlu navigasi
      } else {
        // Lakukan navigasi untuk halaman lain
        switch (_selectedIndex) {
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
          case 3:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatScreen()),
            );
            break;
          case 4:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DoktorProfile()),
            );
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add more space to move everything down
          SizedBox(height: 20), // Adjust this to move content lower

          // Teks "Appointments" dengan center alignment
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "List Patient",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 40),

          // Konten janji temu berdasarkan tab
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                if (_tabIndex == 0) ...[
                  // Tampilkan janji temu upcoming
                  _buildAppointmentCard(),
                  _buildAppointmentCard(),
                  _buildAppointmentCard(),
                  _buildAppointmentCard(),
                ] else ...[
                  // Tampilkan janji temu yang sudah lewat (Past)
                  _buildAppointmentCard(),
                  _buildAppointmentCard(),
                  _buildAppointmentCard(),
                ],
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
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
        onTap: _onItemTapped, // Panggil fungsi _onItemTapped saat item diklik
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
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
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
        style: TextStyle(
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
          MaterialPageRoute(builder: (context) => DoctorScreen()),
        );
      },
      child: Card(
        color: Color.fromRGBO(85, 220, 85, 0.498),
        margin: EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/ivan.png'),
                radius: 30,
              ),
              SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mr. Ivan",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                        "want to fix appointment with you for medical checkup."),
                    SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "5:30pm to 6:30pm",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
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
