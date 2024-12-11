import 'package:flutter/material.dart';
import 'package:program/page/user.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // Pindah ke UserPage ketika gambar di-tap
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const UserPage()),
          );
        },
        child: Center(
          child: Image.asset('assets/images/logoo.png', width: 300),
        ),
      ),
    );
  }
}
