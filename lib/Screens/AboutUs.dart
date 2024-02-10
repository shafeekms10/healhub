import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  _OptionsPageState createState() => _OptionsPageState();
}

class _OptionsPageState extends State<AboutUsPage> {
  String? selectedOption;
  Map<String, String> optionContents = {
    'HealHub': '\nOur mission\nRemove barriers to therapy and make mental health care more accessible to anyone and everyone who is in need of assistance.\n\nOur vision\nTo make it known that no one is alone in their problems and to ensure a better, less stressful life for everyone through our app and its users.',
    'Our Services': '\nAs our mission and vision says, we aim to provide a helping hand to anyone and everyone in need of assistance or sometimes, just some company. To fulfill those needs we offer the following services.\n\n ',
    'FAQ': '\nHere’s some useful information for you to help navigate the app easier and faster. ',
    'Volunteer': '\nJoin a team of heroes that’s changing and saving lives!\n\nWe are a group of compassionate professionals, who strive to help more people live a better and happier life every day. We are growing fast and always looking for new people to help us out with this.\n\nWHAT WE’RE LOOKING FOR \n\nWe at HealHub make sure our clients get the best care possible through registered, trained, and experienced Practitioner Psychologists, Counsellors, and similar applicable recognized professional certifications.',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Options'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Option Row
          Container(
            color: Colors.greenAccent,
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildOption('HealHub'),
                  buildOption('Our Services'),
                  buildOption('FAQ'),
                  buildOption('Volunteer'),
                ],
              ),
            ),
          ),
          // Selected Option Content
          Expanded(
              child: selectedOption != null
                  ? Text(
                optionContents[selectedOption!] ?? '',
                style: TextStyle(fontSize: 18,color: Colors.black),
              )
                  :
              Center(
                child:Text(
                  'Select an option to view its contents',
                  style: TextStyle(fontSize: 18,color: Colors.black),
                ),
              )
          ),
        ],
      ),
    );
  }

  Widget buildOption(String option) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = option;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(5.0),
        ),
        margin: const EdgeInsets.all(4.0),
        child: Text(
          option,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}