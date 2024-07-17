import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';

import '../../global.dart';

class Splash extends StatelessWidget {
 
  Splash({super.key});

  Future init(context) async {
    await Future.delayed(Duration(seconds: 3));
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      currentuser = user;
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/login' );
    }
  }

//show a loading screen while waiting for the init function to complete
  @override
  Widget build(BuildContext context) {
    init(context);
    return Scaffold(
      backgroundColor: theme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/loading.json'),
            Text('Loading...', style: TextStyle(color: theme.white)),
          ],
        ),
      ),
    );
  }
}
