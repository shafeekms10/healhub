import 'package:flutter/material.dart';
import 'package:healhub/Screens/signin_screen.dart';
import 'package:healhub/Screens/signup_screen.dart';

class SigninOrSignup extends StatefulWidget {
  const SigninOrSignup({super.key});

  @override
  State<SigninOrSignup> createState() => _SigninOrSignupState();
}

class _SigninOrSignupState extends State<SigninOrSignup> {
  bool showSignIn = true;

  void toggle() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(onTap: toggle);
    } else {
      return SignUp(onTap: toggle);
    }
  }
}
