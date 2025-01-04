import 'package:flutter/material.dart';
import 'package:program/page/auth/create.dart';

class Verifikasipasien extends StatefulWidget {
  const Verifikasipasien({super.key});

  @override
  _VerifyPageState createState() => _VerifyPageState();
}

class _VerifyPageState extends State<Verifikasipasien> {
  final TextEditingController _codeController1 = TextEditingController();
  final TextEditingController _codeController2 = TextEditingController();
  final TextEditingController _codeController3 = TextEditingController();
  final TextEditingController _codeController4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'VERIFY YOUR NUMBER',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Please Enter The 4 Digit Code Sent To',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                '+6281379625386', // Nomor yang dikirimkan kode verifikasi
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCodeField(_codeController1),
                  _buildCodeField(_codeController2),
                  _buildCodeField(_codeController3),
                  _buildCodeField(_codeController4),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                ),
                onPressed: () {
                  // Langsung pindah ke halaman CreateNewPasswordPage tanpa verifikasi kode
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateNewPasswordPage()),
                  );
                },
                child: const Text(
                  'VERIFY',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget untuk membangun input kode verifikasi
  Widget _buildCodeField(TextEditingController controller) {
    return SizedBox(
      width: 50,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 24),
        maxLength: 1, // Membatasi hanya 1 digit
        decoration: InputDecoration(
          hintText: '0', // Tampilkan '0' sebagai placeholder
          hintStyle: const TextStyle(fontSize: 24, color: Colors.black54),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          counterText: '', // Menghilangkan teks '0/1'
        ),
      ),
    );
  }
}
