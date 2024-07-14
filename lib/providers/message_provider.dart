import 'package:flutter/material.dart';
import '../models/user.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';

class MessageProvider with ChangeNotifier {
  List<Message> _messages = [];

  List<Message> get messages => _messages;
}
