import 'package:flutter/material.dart';
import 'package:program/page/auth/appoitment.dart';
import 'package:program/page/auth/chat.dart';
import 'package:program/page/auth/groupchat.dart';
import 'package:program/page/auth/profiledoktor.dart';
import 'package:program/page/auth/rekoomen.dart';
import 'package:program/page/auth/setting.dart';

class PossibleDiseasePage extends StatelessWidget {
  final Map<String, dynamic> diagnosis;

  const PossibleDiseasePage({super.key, required this.diagnosis});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Keluhan Anda:",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              diagnosis["keluhan"],
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 16),
            Text(
              "Kemungkinan Penyakit:",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...diagnosis["penyakit"].map<Widget>((penyakit) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "- $penyakit",
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
              );
            }).toList(),
            const SizedBox(height: 16),
            Text(
              "Rekomendasi Nutrisi:",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...diagnosis["nutrisi"].map<Widget>((nutrisi) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "- $nutrisi",
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
