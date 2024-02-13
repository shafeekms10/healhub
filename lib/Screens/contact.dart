import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.greenAccent,
        title: const Text('Contact Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.phone,
              size: 120,
              color: Colors.teal,
            ),
            SizedBox(height: 20),
            Text(
              'Need to contact us?\n',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'At Heal Hub, we are committed to providing you with a supportive and confidential space for your mental health and well-being. If you have any questions, concerns, or need assistance, our dedicated team is here to help.\n',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'For all your needs and purposes, if you need any sort of assistance please do not hesitate do contact us below.',
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Phone: 0701111111',
              style: TextStyle(fontSize: 18),
            ),
            Center(
                child:Text(
                  'Address - Heal Hub - Ratmalana\n41, Lumbini Avenue, Ratmalana, Sri Lanka',
                  style: TextStyle(fontSize: 18),
                )),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement contact functionality here
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              ),
              child: Text(
                'Contact Now',
                style: TextStyle(fontSize: 18,color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}