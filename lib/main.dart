import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gozip/firebase_options.dart';
import 'package:gozip/screens/pages/login.dart';
import 'package:gozip/screens/pages/splash.dart';
import 'package:provider/provider.dart';
import 'providers/user_provider.dart';
import 'providers/message_provider.dart';
import '../screens/pages/home.dart';
//import 'firebase_c'

void main() async{
  
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
  );


  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => MessageProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomePage(),
      routes: {
      '/login': (context) => Login(),
        //'/register': (context) => RegisterPage(),
       // '/chat': (context) => ChatPage(),
       '/home': (context) => HomePage(),
       '/splash': (context) => Splash(),
      },
      initialRoute: '/splash',
    );
  }
}
