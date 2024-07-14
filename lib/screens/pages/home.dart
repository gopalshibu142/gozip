import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';
import '../../providers/message_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    ChatsListPage(),
    CallsPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class ChatsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final messageProvider = Provider.of<MessageProvider>(context);

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
              itemCount: userProvider.users.length,
              itemBuilder: (context, index) {
                final user = userProvider.users[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage('https://picsum.photos/200'),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "user.name.split(' ')[0]",
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
              itemCount: messageProvider.messages.length,
              itemBuilder: (context, index) {
                final message = messageProvider.messages[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage("https://picsum.photos/200"),
                  ),
                  title: Text("message.sender.name", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)),
                  subtitle: Text("message.time", style: GoogleFonts.poppins(fontSize: 14)),
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

class CallsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calls', style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Text('Calls Page', style: GoogleFonts.poppins(fontSize: 18)),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Text('Profile Page', style: GoogleFonts.poppins(fontSize: 18)),
      ),
    );
  }
}
