import 'package:flutter/material.dart';
import 'package:healhub/Screens/about.dart';
import 'package:healhub/Screens/contact.dart';
import 'package:healhub/Screens/chatbot.dart';
import 'package:healhub/Screens/counsellor_directory.dart';
import 'package:healhub/Screens/hotlines.dart';
import 'package:healhub/Screens/profile_screen.dart';
import 'package:healhub/Screens/resources.dart';
import 'package:healhub/Screens/signin_screen.dart';
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
  "Counsellors",
  "Chat",
  "Chat Bot",
  "Resources",
  "Hotlines",
  "Feedback",
];

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
        drawer: const NavigationDrawer(),
        body: Column(
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
                    AssetImage('assets/images/4.jpg')
                  ],
                  dotBgColor: Colors.transparent,
                  dotColor: Colors.black,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.teal.shade50, Colors.white,Colors.teal.shade50])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 7,
                  ),
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
                                  builder: (context) => Directory()
                              ));
                            }
                            else if(index == 1){
                            }
                            else if(index == 2){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ChatScreen()
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
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildHeader(context),
          buildMenuItems(context),
        ],
      ),
    ),
  );
  Widget buildHeader(BuildContext context)=> Material(
    color:Colors.teal.shade300,
    child:InkWell(
      onTap: (){
        Navigator.pop(context);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context)=>const UserPage(name: 'SahanMax', email: 'Sahan@gmail.com'),
        ));
      },
      child:Container(
        padding:  EdgeInsets.only(
          top: 24+ MediaQuery.of(context).padding.top,
          bottom:24,
        ),
        child: const Column(
          children: [
            CircleAvatar(
              radius: 52,
              backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/c/c0/Siddharth_Nigam_snapped_promoting_his_film_Kisi_Ka_Bhai_Kisi_Ki_Jaan_at_Mehboob_Studios_in_Bandra_%28cropped%29.jpg'
              ),
            ),
            SizedBox(height: 12,),
            Text(
              'SahanMax',
              style: TextStyle(fontSize:28,color: Colors.white),
            ),
            Text(
                'Sahan@gmail.com',
                style:TextStyle(fontSize:14,color:Colors.white)
            ),
          ],
        ),
      ),
    ),
  );
  Widget buildMenuItems(BuildContext context) =>  Container(
    padding: const EdgeInsets.all(30),
    child:Wrap(
      runSpacing: 18,
      children: [
        ListTile(
          leading: const Icon(Icons.home_outlined,),
          title: const Text('Home'),
          onTap: ()=>
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder:(context)=>const Home(),
              )),
        ),
        ListTile(
          leading:const Icon(Icons.collections_bookmark_outlined),
          title: const Text('About Us'),
          onTap: (){
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AboutUsPage()
            ));
          },
        ),
        ListTile(
          leading:const Icon(Icons.call),
          title: const Text('Contact Us'),  onTap: (){
          Navigator.pop(context);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ContactUsPage()
          ));
        },
        ),
        ListTile(
          leading:const Icon(Icons.notification_add),
          title: const Text('Notifications'),
          onTap: (){},
        ),
        /* ListTile(
      leading:const Icon(Icons.favorite_border),
      title: const Text('Workflow'),
      onTap: (){},
    ),*/
        const Divider(color: Colors.black54,),
        ListTile(
          leading:const Icon(Icons.login_outlined),
          title: const Text('Log Out'),
          onTap: (){
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SignIn()
            ));
          },
        )

      ],
    ),
  );
}