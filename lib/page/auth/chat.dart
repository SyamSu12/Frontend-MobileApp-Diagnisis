import 'package:flutter/material.dart';
import 'home.dart'; // Pastikan path ini benar sesuai lokasi file HomeScreen

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, String>> _messages = [];
  final TextEditingController _controller = TextEditingController();

  final Map<String, String> _responses = {
    "hello": "Hayy adakah yang bisa saya bantu?",
    "bagaimana kabarnya?": "halo saya disini akan membantu anda!",
    "permasalahan": "Tolong deskripsikan permasalahan anda secara terperinci",
    "bye": "Goodbye! Take care!",
    // Kategori Gejala Umum
    "saya sedang demam":
        "Demam adalah gejala umum. Sudahkah Anda mengukur suhu tubuh Anda?",
    "saya sedang sakit kepala":
        "Sakit kepala bisa disebabkan oleh berbagai hal. Apakah Anda juga merasa mual atau pusing?",
    "saya sedang batuk":
        "Apakah batuk Anda kering atau berdahak? Sudah berapa lama Anda mengalaminya?",
    "saya sedang pilek":
        "Pilek biasanya disebabkan oleh infeksi virus. Minum air hangat dan istirahat yang cukup.",
    "saya mengalami sesak napas":
        "Sesak napas perlu diperhatikan. Apakah Anda memiliki riwayat asma atau alergi?",

    // Kategori Pencernaan
    "saya merasa mual":
        "Mual bisa disebabkan oleh berbagai hal. Apakah Anda juga mengalami muntah?",
    "saya merasakan diare":
        "Pastikan Anda tetap terhidrasi. Sudah berapa kali Anda buang air hari ini?",
    "saya sedang sembelit":
        "Cobalah untuk konsumsi makanan berserat tinggi seperti buah dan sayur.",
    "perut saya kembung":
        "Kembung bisa disebabkan oleh gas berlebih. Hindari makanan berlemak dan bersoda.",
    "saya muntah-muntah":
        "Muntah yang berlebihan bisa menyebabkan dehidrasi. Sudahkah Anda minum cukup cairan?",

    // Kategori Nyeri
    "saya merasakah nyeri sendi":
        "Nyeri sendi bisa disebabkan oleh radang atau aktivitas berlebihan. Sudahkah Anda mengompresnya?",
    "saya merasakah nyeri punggung":
        "Cobalah istirahat dengan posisi yang nyaman. Apakah nyeri muncul saat bergerak?",
    "saya merasakah nyeri perut":
        "Nyeri perut bisa berasal dari berbagai penyebab. Di bagian mana nyeri dirasakan?",
    "saya merasakah nyeri dada":
        "Nyeri dada harus diperhatikan. Apakah Anda merasa sesak atau berdebar-debar?",
    "saya merasakah nyeri leher":
        "Nyeri leher bisa disebabkan oleh postur tubuh. Hindari duduk terlalu lama tanpa peregangan.",

    // Kategori Kulit
    "kulit saya gatal-gatal":
        "Gatal bisa disebabkan oleh alergi atau iritasi. Apakah ada ruam di kulit Anda?",
    "saya mengalami ruam kulit":
        "Ruam bisa disebabkan oleh infeksi atau alergi. Hindari menggaruk untuk mencegah iritasi.",
    "kulit saya kering":
        "Kulit kering biasanya karena dehidrasi. Pastikan Anda minum cukup air dan gunakan pelembap.",
    "saya alergi kulit":
        "Apakah Anda tahu penyebab alergi Anda? Hindari pemicu dan gunakan antihistamin jika perlu.",
    "saya eksim":
        "Eksim memerlukan perawatan khusus. Gunakan pelembap dan hindari sabun yang keras.",

    // Kategori Psikologi
    "saya merasa stres":
        "Stres bisa berdampak pada kesehatan. Cobalah teknik relaksasi seperti pernapasan dalam.",
    "saya merasa cemas":
        "Rasa cemas bisa normal, tetapi jika mengganggu aktivitas, coba bicarakan dengan profesional.",
    "saya merasa susah tidur":
        "Susah tidur bisa disebabkan oleh stres atau kebiasaan. Hindari kafein di malam hari.",
    "saya merasa lelah terus-menerus":
        "Kelelahan bisa disebabkan oleh anemia atau kurang tidur. Perhatikan pola makan dan istirahat.",
    "saya merasa mudah marah":
        "Perubahan emosi bisa dipengaruhi oleh hormon atau stres. Cobalah untuk rileks.",

    // Kategori Lainnya
    "saya ingin cek kesehatan":
        "Pastikan Anda menjadwalkan pemeriksaan rutin dengan dokter.",
    "saya ingin vaksinasi":
        "Vaksinasi melindungi Anda dari penyakit. Hubungi fasilitas kesehatan terdekat.",
    "saya ingin konsultasi kehamilan":
        "Kesehatan kehamilan penting. Pastikan untuk rutin memeriksakan kandungan.",
    "saya ingin cek tekanan darah":
        "Tekanan darah ideal biasanya 120/80 mmHg. Apakah Anda memiliki alat pengukur di rumah?",
    "saya ingin cek gula darah":
        "Kadar gula normal bervariasi, tergantung kondisi. Apakah Anda memiliki riwayat diabetes?",
  };

  @override
  void initState() {
    super.initState();
    _showWelcomePopup();
  }

  void _showWelcomePopup() {
    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Selamat Datang"),
            content: const Text(
              "Terimakasih sudah ingin berkonsultasi dengan Nutrionist. Ahli Nutrisi akan tersedia sesuai dengan janji yang telah Anda buat.",
            ),
            actions: [
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop(); // Tutup popup
                },
              ),
            ],
          );
        },
      );
    });
  }

  void _sendMessage(String message) {
    if (message.trim().isEmpty) return;

    setState(() {
      _messages.add({"sender": "user", "text": message});
    });

    String response = "Maaf, saya tidak memahami pertanyaan Anda.";
    for (final keyword in _responses.keys) {
      if (message.toLowerCase().contains(keyword)) {
        response = _responses[keyword]!;
        break;
      }
    }

    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _messages.add({"sender": "bot", "text": response});
      });
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Ask me",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.home, color: Colors.black),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isUser = message["sender"] == "user";

                return Align(
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: isUser
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!isUser)
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/images/ivan.png'),
                        ),
                      if (!isUser) const SizedBox(width: 8),
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 4.0),
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color:
                                isUser ? Colors.green[300] : Colors.grey[200],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            message["text"]!,
                            style: TextStyle(
                              color: isUser ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      if (isUser) const SizedBox(width: 8),
                      if (isUser)
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage('assets/icons/Intersect.png'),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.attachment),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Message",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                      ),
                      onSubmitted: _sendMessage,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () => _sendMessage(_controller.text),
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
