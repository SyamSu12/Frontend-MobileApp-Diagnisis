import 'package:flutter/material.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Groupchat(),
    );
  }
}

class Groupchat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/profile.jpg'), // Profile image
                  radius: 20, // Adjust size if needed
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Colors.white, width: 1.5), // White border
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Comunitas", style: TextStyle(color: Colors.black)),
                Text("Active now",
                    style: TextStyle(color: Colors.black54, fontSize: 12)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.call, color: Colors.black), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.videocam, color: Colors.black),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.more_vert, color: Colors.black),
              onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          // Teks "Sunday" di atas kotak pertama dengan jarak lebih dekat
          Padding(
            padding: const EdgeInsets.only(top: 40.0, bottom: -0),
            child: Center(
              child: Text(
                'Sunday',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                _buildMessageBubble(
                  message:
                      "Sed ligula erat,mauris sit eros a viverra amet dictum id?",
                  isSent: false,
                  timestamp: "Yesterday",
                ),
                _buildMessageBubble(
                  message:
                      "Sed ligula erat,mauris sit eros a viverra amet dictum id?",
                  isSent: true,
                  timestamp: "3:45 PM",
                ),
                _buildVoiceMessageBubble(isSent: true, timestamp: "3:46 PM"),
                // Teks "Just now" ditambahkan di sini dengan jarak lebih dekat
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30.0, bottom: 2.0), // Menurunkan teks lebih dekat
                  child: Center(
                    child: Text(
                      "Just now",
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ),
                ),
                _buildMessageBubble(
                  message:
                      "Sed ligula erat,mauris sit eros a viverra amet dictum id?",
                  isSent: false,
                  timestamp: "Just now",
                ),
                _buildMessageBubble(
                  message:
                      "Sed ligula erat,mauris sit eros a viverra amet dictum id?",
                  isSent: true,
                  timestamp: "Just now",
                ),
              ],
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(
      {required String message,
      required bool isSent,
      required String timestamp}) {
    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            padding: EdgeInsets.all(16.0),
            constraints: BoxConstraints(maxWidth: 300),
            decoration: BoxDecoration(
              color: isSent ? Colors.green[300] : Colors.grey[300],
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage('assets/images/chat_bubble.png'),
                fit: BoxFit.cover,
                alignment: Alignment.centerLeft,
              ),
            ),
            child: Text(
              message,
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(height: 4),
          Text(
            timestamp,
            style: TextStyle(fontSize: 10, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  Widget _buildVoiceMessageBubble(
      {required bool isSent, required String timestamp}) {
    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            padding: EdgeInsets.all(16.0),
            constraints: BoxConstraints(maxWidth: 300),
            decoration: BoxDecoration(
              color: isSent ? Colors.green[300] : Colors.grey[300],
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage('assets/images/chat_bubble.png'),
                fit: BoxFit.cover,
                alignment: Alignment.centerLeft,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.play_arrow, color: Colors.white),
                SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 4,
                    color: Colors.black45,
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  timestamp,
                  style: TextStyle(fontSize: 10, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      color: Colors.white,
      child: Row(
        children: [
          IconButton(icon: Icon(Icons.attachment), onPressed: () {}),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Type a message",
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(icon: Icon(Icons.mic), onPressed: () {}),
        ],
      ),
    );
  }
}
