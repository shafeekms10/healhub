import 'package:flutter/material.dart';
import 'package:healhub/Screens/Client/sidemenu.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CounselorProfileScreen extends StatelessWidget {

  const CounselorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Counselor Profile',
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
      drawer: const Sidemenu(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage('https://img.freepik.com/free-photo/elegant-businessman-office_155003-9641.jpg'),
                ),
                const SizedBox(height: 20),
                const Text(
                  'David Johnson',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Counsellor',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),
                const ListTile(
                  leading: Icon(Icons.email),
                  title: Text('david@gmail.com'),
                ),
                const ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('+94123456789'),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 17, right: 17),
                  child: Text('Experienced counselor with 10 years specializing in anxiety and stress management. Committed to creating a safe space for individuals to explore and overcome challenges. Holds a Ph.D. in Counseling Psychology. Passionate about fostering resilience and promoting positive change.',
                    style: TextStyle(fontSize: 15),textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () async{
                    await launchUrlString("https://zcal.co/i/vuc6XAJm");
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => TimeSlotsScreen(counselor: counselor),
                    //   ),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal.shade400,
                  ),
                  child: const Text(
                    'Schedule a Meeting',
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,)
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}