import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      appBar: AppBar(
        backgroundColor: Colors.white, // Set app bar background to white
        elevation: 0,
        title: Text(
          "Ask me",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                // User's message
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/images/ivan.png'),
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Modified container for Ali's message with rectangle box
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal:
                                    20), // Adjusted for rectangular shape
                            decoration: BoxDecoration(
                              color:
                                  Colors.white, // Set the background to white
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: Colors.black,
                                  width: 2), // Add black border
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Ali",
                                    style: TextStyle(color: Colors.blue)),
                                SizedBox(height: 4),
                                Text("Halooo"),
                              ],
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "19:00",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),

                // Doctor's message with PDF attachment
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.all(
                                20), // Increased padding for bigger box
                            decoration: BoxDecoration(
                              color: Colors.green[300],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.picture_as_pdf, color: Colors.black),
                                SizedBox(width: 8),
                                Text("Hasil Medis",
                                    style: TextStyle(color: Colors.black)),
                              ],
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "19:01",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(width: 8),
                      CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            AssetImage('assets/icons/Intersect.png'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Message input box at the bottom
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.attachment),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Message",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.mic),
                    onPressed: () {},
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
