import 'package:flutter/material.dart';
import 'package:healhub/Screens/about.dart';
import 'package:healhub/Screens/contact.dart';
import 'package:healhub/Screens/home_screen.dart';
import 'package:healhub/Services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class Sidemenu extends StatefulWidget {
  const Sidemenu({Key? key}) : super(key: key);

  @override
  State<Sidemenu> createState() => _SidemenuState();
}

class _SidemenuState extends State<Sidemenu> {
  void signOut(){
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.signOut();
  }

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
    child:Container(
      padding:  EdgeInsets.only(
        top: 24+ MediaQuery.of(context).padding.top,
        bottom:24,
      ),
      child: const Column(
        children: [
          CircleAvatar(
            radius: 52,
            backgroundImage: AssetImage('assets/images/profile.jpg'),
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
        const Divider(color: Colors.black54,),
        ListTile(
          leading:const Icon(Icons.login_outlined),
          title: const Text('Log Out'),
          onTap: signOut,
        ),
      ],
    ),
  );
}