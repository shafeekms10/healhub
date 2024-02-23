import 'package:flutter/material.dart';
import 'package:healhub/Screens/Counsellor/chat_list.dart';
import 'package:healhub/Screens/Counsellor/meetings.dart';
import 'package:healhub/Screens/Counsellor/feedback_counsellor.dart';
import 'package:healhub/Screens/contact.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:healhub/Screens/Counsellor/sidemenu_counsellor.dart';

List imgData = [
  "assets/images/home1.png",
  "assets/images/home2.png",
  "assets/images/home6.png",
  "assets/images/home5.png"
];

List titles = [
  "Schedules",
  "Chat",
  "Feedback",
  "Contact Admin"
];

class HomescreenCounsellor extends StatelessWidget {
  const HomescreenCounsellor({Key? key}) : super(key: key);

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
        drawer: const SidemenuCounsellor(),
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
                  const SizedBox(height: 22),
                  GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.3,
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
                                  builder: (context) => const Meetings()
                              ));
                            }
                            else if(index == 1){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Chat()
                              ));
                            }
                            else if(index == 2){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const AppCoun()
                              ));
                            }
                            else if(index == 3){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const ContactUsPage()
                              ));
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 23),
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