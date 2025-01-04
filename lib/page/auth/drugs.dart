import 'package:flutter/material.dart';

class DrugsScreen extends StatelessWidget {
  const DrugsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background putih
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black), // Ikon warna hitam
          onPressed: () {
            Navigator.pop(context); // Untuk kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nutrion',
              style: TextStyle(
                color: Colors.black, // Ubah teks menjadi hitam
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Image.asset(
                'assets/images/drugs.png', // Gambar utama
                height: 200,
              ),
            ),
            const SizedBox(height: 60),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3, // Jumlah kolom
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1, // Tetap mempertahankan proporsi kotak
                children: [
                  buildDrugBox('Drugs', 'assets/images/pil.png'),
                  buildDrugBox('Vitamin', 'assets/images/vitamin.png'),
                  buildDrugBox('Article', 'assets/images/objek.png'),
                  buildDrugBox('Genesis', 'assets/images/genisit.png'),
                  buildDrugBox('Imodium', 'assets/images/imodium.png'),
                  buildDrugBox('Forlax', 'assets/images/forlax.png'),
                  buildDrugBox('Promag', 'assets/images/promag.png'),
                  buildDrugBox('Bacteria', 'assets/images/virus.png'),
                  buildDrugBox('Vitazym', 'assets/images/vitazym.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDrugBox(String name, String imagePath) {
    return Column(
      children: [
        Card(
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.all(12.0), // Padding sedikit lebih besar
            child: Image.asset(
              imagePath,
              width: 50, // Ukuran gambar sedikit lebih besar
              height: 50, // Ukuran gambar sedikit lebih besar
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(
            height: 10), // Jarak sedikit lebih besar antara gambar dan nama
        Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 16, color: Colors.black), // Ukuran teks lebih besar
        ),
      ],
    );
  }
}
