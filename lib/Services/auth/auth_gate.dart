import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healhub/Screens/home_screen.dart';
import 'package:healhub/Services/auth/signin_or_signup.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return const Homescreen();
          }
          else{
            return const SigninOrSignup();
          }
        },
      ),
    );
  }
}
