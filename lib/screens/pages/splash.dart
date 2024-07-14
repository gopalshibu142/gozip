import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Splash extends StatelessWidget {
 
  Splash({super.key});

  Future init(context) async {
    await Future.delayed(Duration(seconds: 2));
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/login' );
    }
  }
@override
void initState() {
  

}
//show a loading screen while waiting for the init function to complete
  @override
  Widget build(BuildContext context) {
    init(context);
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
