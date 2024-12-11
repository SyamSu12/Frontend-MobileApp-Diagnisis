import 'package:flutter/material.dart';
import 'package:program/page/auth/login.dart'; // Import halaman LoginPage untuk Nutritionist
import 'package:program/page/auth/loginpasien.dart'; // Import halaman LoginPasienPage untuk Patient

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 186, 231, 188), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Menambahkan tanda panah di bagian atas
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    // Aksi untuk kembali
                    Navigator.pop(context);
                  },
                ),
              ),
              // Gambar pertama
              Image.asset(
                'assets/images/patient.png',
                width: 315,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman LoginPage untuk Nutritionist
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide(
                        color: const Color.fromARGB(255, 141, 221, 144),
                        width: 4),
                  ),
                ),
                child: Text(
                  'Patient',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 16),
              // Gambar kedua
              Image.asset(
                'assets/images/doctor.png',
                width: 315,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman LoginPasienPage untuk Patient
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginPasienPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide(color: Colors.green, width: 4),
                  ),
                ),
                child: Text(
                  'Nutritionist',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}