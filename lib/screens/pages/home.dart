import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gozip/database/auth.dart';
import 'package:gozip/global.dart';
import 'package:gozip/screens/pages/people.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';
import '../../providers/message_provider.dart';

import 'package:circle_nav_bar/circle_nav_bar.dart';

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
      backgroundColor: theme.background,
      appBar: AppBar(
        backgroundColor: theme.black,
        title: Text('Gozip',
            style:
                GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CircleNavBar(
        activeIndex: _selectedIndex,
        activeIcons: [
        Icon(Icons.chat_bubble, color: theme.white),
        Icon(Icons.call, color: theme.white),
        Icon(Icons.person, color: theme.white),
        ],
        inactiveIcons: [
        Icon(Icons.chat_bubble, color: theme.white),
        Icon(Icons.call, color: theme.white),
        Icon(Icons.person, color: theme.white),
        ],
        height: 60  ,
        circleWidth: 60,
        color: theme.black,
        onTap: _onItemTapped,
      )
    );
  }
}


class CallsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.background,
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
    backgroundColor: theme.background,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundColor: theme.mid,
              child: Icon(Icons.person, size: 50, color: theme.white),
            ),
            SizedBox(height: 10),
            Text('Username', style: GoogleFonts.poppins(fontSize: 24)),
            SizedBox(height: 10),
            Text('Status', style: GoogleFonts.poppins(fontSize: 18)),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text('Edit Profile'),
            ),
            TextButton(
              onPressed: () {
                AuthService auth = AuthService();
                auth.signOut();
                Navigator.pushNamed(context, '/login');
              },
              child: Text('Logout'),
            ),
          ],
        ),
      )
    );
  }
}
