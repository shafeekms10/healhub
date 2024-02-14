import 'package:flutter/material.dart';
import 'package:healhub/Screens/about.dart';
import 'package:healhub/Screens/contact.dart';
import 'package:healhub/Screens/home_screen.dart';
import 'package:healhub/Screens/profile_screen.dart';
import 'package:healhub/Screens/signin_screen.dart';

class Sidemenu extends StatelessWidget {
  const Sidemenu({Key? key}) : super(key: key);

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
                builder:(context)=>const Homescreen(),
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