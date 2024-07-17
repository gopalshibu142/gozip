import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gozip/providers/user_provider.dart';
import 'package:gozip/providers/message_provider.dart';
import 'package:gozip/models/theme.dart';

import 'package:gozip/models/theme.dart';


class ChatsListPage extends StatelessWidget {
  ThemeUI theme = ThemeUI(Blueee());
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final messageProvider = Provider.of<MessageProvider>(context);

    return Scaffold(
      backgroundColor: theme.background,
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.mid,

        onPressed: () {
         
        },
        child: Icon(Icons.add, color: theme.white),
      ),
      body: Column(
        children: [
         
        ],
      ),
    );
  }
}