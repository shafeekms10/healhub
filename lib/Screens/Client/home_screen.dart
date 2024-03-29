import 'package:flutter/material.dart';
import 'package:healhub/Screens/Client/chat_page_clients.dart';
import 'package:healhub/Screens/Client/counsellor_directory.dart';
import 'package:healhub/Screens/Client/feedback.dart';
import 'package:healhub/Screens/Client/healhub_bot.dart';
import 'package:healhub/Screens/Client/hotlines.dart';
import 'package:healhub/Screens/Client/resources.dart';
import 'package:healhub/Screens/Client/sidemenu.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

List imgData = [
  "assets/images/home1.png",
  "assets/images/home2.png",
  "assets/images/home3.png",
  "assets/images/home4.png",
  "assets/images/home5.png",
  "assets/images/home6.png"
];

List titles = [
  "Schedule",
  "Chat",
  "Chat Bot",
  "Resources",
  "Hotlines",
  "Feedback",
];

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HealHub',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('HealHub',
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
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.teal.shade50, Colors.white,Colors.teal.shade50])),
          child: Column(
            children: [
              SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      )
                  ),
                  height: 410,
                  child: AnotherCarousel(
                    images: const [
                      AssetImage('assets/images/1.jpg'),
                      AssetImage('assets/images/2.jpg'),
                      AssetImage('assets/images/3.jpg'),
                    ],
                    dotBgColor: Colors.transparent,
                    dotColor: Colors.black,
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 18),

                  GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.85,
                        mainAxisSpacing: 1,
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: imgData.length,
                      itemBuilder: (context,index){
                        return InkWell(
                          onTap: (){
                            if(index == 0){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => const CounselorProfileScreen()
                              ));
                            }
                            else if(index == 1){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const ChatPageClient()
                              ));
                            }
                            else if(index == 2){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Chatbot()
                              ));
                            }
                            else if(index == 3){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Resources()
                              ));
                            }
                            else if(index == 4){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Hotlines()
                              ));
                            }
                            else if(index == 5){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const App()
                              ));
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  spreadRadius: 2,
                                  blurRadius: 8
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(imgData[index],
                                  width: 75,
                                ),
                                Center(
                                  child: Text(titles[index],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}