import 'package:flutter/material.dart';
import 'package:healhub/Screens/Counsellor/sidemenu_counsellor.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Meetings extends StatelessWidget {

  const Meetings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Meetings',
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
      drawer: const SidemenuCounsellor(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async{
                    await launchUrlString("https://accounts.google.com/o/oauth2/v2/auth/oauthchooseaccount?access_type=offline&prompt=select_account&include_granted_scopes=true&response_type=code&redirect_uri=https%3A%2F%2Fzcal.co%2Fauth%2Fgoogle%2Fcallback&scope=profile%20email%20https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fcalendar&client_id=819664399036-p5vi54aejulppm5k48ocka6b49di1tjd.apps.googleusercontent.com&service=lso&o2v=2&theme=glif&flowName=GeneralOAuthFlow");
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
                    'Meeting Details',
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