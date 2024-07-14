import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatelessWidget {
  final List<String> profileImages = [
    'https://randomuser.me/api/portraits/women/1.jpg',
    'https://randomuser.me/api/portraits/men/2.jpg',
    'https://randomuser.me/api/portraits/men/3.jpg',
    'https://randomuser.me/api/portraits/women/4.jpg',
    'https://randomuser.me/api/portraits/women/5.jpg',
  ];

  final List<Map<String, String>> messages = [
    {'name': 'Arnold', 'time': '2d', 'image': 'https://randomuser.me/api/portraits/men/6.jpg'},
    {'name': 'Camila', 'time': '17m ago', 'image': 'https://randomuser.me/api/portraits/women/7.jpg'},
    {'name': 'Jake', 'time': '1h ago', 'image': 'https://randomuser.me/api/portraits/men/8.jpg'},
    {'name': 'Matt', 'time': '1h ago', 'image': 'https://randomuser.me/api/portraits/men/9.jpg'},
    {'name': 'Liliam', 'time': 'Active yesterday', 'image': 'https://randomuser.me/api/portraits/women/10.jpg'},
    {'name': 'Alison', 'time': 'Active now', 'image': 'https://randomuser.me/api/portraits/women/11.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat', style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            padding: EdgeInsets.all(8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: profileImages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(profileImages[index]),
                      ),
                      SizedBox(height: 4),
                      Text(
                        ['Elara', 'Stellan', 'Callum', 'Freya', 'Thalia'][index],
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(messages[index]['image']!),
                  ),
                  title: Text(messages[index]['name']!, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)),
                  subtitle: Text(messages[index]['time']!, style: GoogleFonts.poppins(fontSize: 14)),
                  trailing: IconButton(
                    icon: Icon(Icons.camera_alt, color: Colors.white),
                    onPressed: () {},
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.edit, color: Colors.white),
              label: Text('New Message', style: GoogleFonts.poppins(fontSize: 16, color: Colors.white)),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
