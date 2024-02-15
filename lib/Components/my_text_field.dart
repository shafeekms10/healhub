import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool obscureText;
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: Icon(icon,size: 17,),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
