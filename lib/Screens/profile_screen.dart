import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key, required this.name, required this.email}) : super(key: key);

  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('User Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Opacity(
          opacity: 0.7,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.teal.shade400, Colors.teal.shade100],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/c/c0/Siddharth_Nigam_snapped_promoting_his_film_Kisi_Ka_Bhai_Kisi_Ki_Jaan_at_Mehboob_Studios_in_Bandra_%28cropped%29.jpg',
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Name: $name',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Email: $email',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}