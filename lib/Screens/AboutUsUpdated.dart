import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: AboutUsPage(),
));

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.teal[300],
        title: Text('Options',style:TextStyle(
            color: Colors.black,
            fontSize: 30
        )
        ),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.teal[300],
                      child: Center(
                        child: Text('About',style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OurServices()),
                        );
                      },
                      child: Container(
                        color: Colors.teal[300],
                        child: Center(
                          child: Text('Our Services',style: TextStyle(
                            fontSize: 15,
                          ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FAQ()),
                        );
                      },
                      child: Container(
                        color: Colors.teal[300],
                        child: Center(
                          child: Text('FAQ',style: TextStyle(
                            fontSize: 15,
                          ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Volunteer()),
                        );
                      },
                      child: Container(
                        color: Colors.teal[300],
                        child: Center(
                          child: Text('Volunteer',style: TextStyle(
                            fontSize: 15,
                          ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Our mission',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  )
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Text('Remove barriers to therapy and make mental health care more accessible to anyone and everyone who is in need of assistance.',style: TextStyle(
                        fontSize: 15
                    )
                    ),
                  ),
                  Divider(height: 20,color: Colors.black87,),
                  Text('Our vision',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  )
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Text('To make it known that no one is alone in their problems and to ensure a better, less stressful life for everyone through our app and its users.',style: TextStyle(
                        fontSize: 15
                    )
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OurServices extends StatelessWidget {
  const OurServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.teal[300],
        title: Text('Options',style:TextStyle(
            color: Colors.black,
            fontSize: 30
        )
        ),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AboutUsPage()),
                        );
                      },
                      child: Expanded(
                        child: Container(
                          color: Colors.teal[300],
                          child: Center(
                            child: Text('About',style: TextStyle(
                              fontSize: 15,
                            ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OurServices()),
                        );
                      },
                      child: Expanded(
                        child: Container(
                          color: Colors.teal[300],
                          child: Center(
                            child: Text('Our Services',style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w900
                            ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FAQ()),
                        );
                      },
                      child: Expanded(
                        child: Container(
                          color: Colors.teal[300],
                          child: Center(
                            child: Text('FAQ',style: TextStyle(
                              fontSize: 15,
                            ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Volunteer()),
                        );
                      },
                      child: Expanded(
                        child: Container(
                          color: Colors.teal[300],
                          child: Center(
                            child: Text('Volunteer',style: TextStyle(
                              fontSize: 15,
                            ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('As our mission and vision says, we aim to provide a helping hand to anyone and everyone in need of assistance or sometimes, just some company. To fulfill those needs we offer the following services.',style: TextStyle(
                      fontSize: 15
                  )
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 5, 10),
                    child: Text('* Finding and booking counseling appointments with professionals of your choice. \n* Secure real-time chatting between users and counselors.\n *Maintain a record of past counseling sessions to track progress.\n* Notifications for upcoming sessions and new messages.\n*Privacy and security measures are in place for user data.\n*Access to support resources such as books, articles, etc.\n*Offer educational resources related to mental health.\n*Emergency hotline service for anyone in need.',style: TextStyle(
                        fontSize: 15
                    )
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FAQ extends StatelessWidget {
  const FAQ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.teal[300],
        title: Text('Options',style:TextStyle(
            color: Colors.black,
            fontSize: 30
        )
        ),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AboutUsPage()),
                          );
                        },
                        child: Expanded(
                          child: Container(
                            color: Colors.teal[300],
                            child: Center(
                              child: Text('About',style: TextStyle(
                                fontSize: 15,
                              ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => OurServices()),
                          );
                        },
                        child: Expanded(
                          child: Container(
                            color: Colors.teal[300],
                            child: Center(
                              child: Text('Our Services',style: TextStyle(
                                fontSize: 15,

                              ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Expanded(
                        child: Container(
                          color: Colors.teal[300],
                          child: Center(
                            child: Text('FAQ',style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w900
                            ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Volunteer()),
                          );
                        },
                        child: Expanded(
                          child: Container(
                            color: Colors.teal[300],
                            child: Center(
                              child: Text('Volunteer',style: TextStyle(
                                fontSize: 15,
                              ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Here’s some useful information for you to help navigate the app easier and faster. ',style: TextStyle(
                        fontSize: 15
                    )
                    ),
                    SizedBox(height: 20,),
                    Text('What is Healhub?', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20
                    ),
                    ),
                    Text('Healhub is a mental wellbeing app designed to connect individuals with licensed counselors and provide online guidance and support for various mental health concerns.We help pair users with licensed counselors based on their preferences, needs, and availability. Users can then engage in confidential and secure online sessions with their assigned counselor. We prioritize user privacy and confidentiality. All communication between users and counselors is encrypted and strictly confidential.'),
                    SizedBox(height: 20,),
                    Text('How do I use the app?', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20
                    ),
                    ),
                    Text('Simply download the app from the App Store or Google Play Store and follow the registration process. Healhub offers a wide range of counseling services, including but not limited to anxiety, depression, stress management, relationship issues, self-esteem, and more. Once you\'ve been matched with a counselor, you can schedule a session directly through the app. Simply select a date and time that works for you, and your counselor will confirm the appointment.'),

                    SizedBox(height: 20,),
                    Text('I \'m experiencing technical issues with the app. What should I do?', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20
                    ),
                    ),
                    Text('If you\'re encountering technical issues, please reach out to our support team for assistance. You can contact us via email at support@[appname].com or through the in-app support chat.',),
                    SizedBox(height: 20,),
                    Text('How can I provide feedback or suggestions for Healhub?', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20
                    ),
                    ),
                    Text('If you\'re encountering technical issues, please reach out to our support team for assistance. You can contact us through the in-app support chat or our contact number available in the Contact Us page.',)
                  ],

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Volunteer extends StatelessWidget {
  const Volunteer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.teal[300],
        title: Text('Options',style:TextStyle(
            color: Colors.black,
            fontSize: 30
        )
        ),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AboutUsPage()),
                        );
                      },
                      child: Expanded(
                        child: Container(
                          color: Colors.teal[300],
                          child: Center(
                            child: Text('About',style: TextStyle(
                              fontSize: 15,
                            ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OurServices()),
                        );
                      },
                      child: Expanded(
                        child: Container(
                          color: Colors.teal[300],
                          child: Center(
                            child: Text('Our Services',style: TextStyle(
                              fontSize: 15,

                            ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FAQ()),
                        );
                      },
                      child: Expanded(
                        child: Container(
                          color: Colors.teal[300],
                          child: Center(
                            child: Text('FAQ',style: TextStyle(
                              fontSize: 15,
                            ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Expanded(
                      child: Container(
                        color: Colors.teal[300],
                        child: Center(
                          child: Text('Volunteer',style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w900
                          ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Join a team of heroes that’s changing and saving lives!',style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  )
                  ),
                  SizedBox(height: 10,),
                  Text('We are a group of compassionate professionals, who strive to help more people live a better and happier life every day. We are growing fast and always looking for new people to help us out with this.'),
                  SizedBox(height: 20,),
                  Text('WHAT WE’RE LOOKING FOR',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  )
                  ),
                  SizedBox(height: 10,),
                  Text('We at HealHub make sure our clients get the best care possible through registered, trained, and experienced Practitioner Psychologists, Counsellors, and similar applicable recognized professional certifications.'

                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

