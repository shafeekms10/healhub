import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HealHub',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('HealHub'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.teal.shade400, Colors.teal.shade100],
              ),
            ),
          ),
        ),
        drawer: const NavigationDrawer(), // Adding the NavigationDrawer widget here
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
          builder: (context)=>const UserPage(name: 'John Doe', email: 'john@example.com'),


        ));

      },
      child:Container(
        padding:  EdgeInsets.only(
          top: 24+ MediaQuery.of(context).padding.top,
          bottom:24,
        ),

        child: Column(
          children: const[
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
                builder:(context)=>const MyApp(),
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
                builder: (context) => const LogoutPage()
            ));
          },
        )

      ],
    ),
  );

}
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: const Text('Welcome to the Home Page!'),
      ),
    );
  }
}

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Page'),
      ),
      body: Center(
        child: const Text('Welcome to the Favorite Page!'),
      ),
    );
  }
}





class LogoutPage extends StatelessWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logout'),
      ),
      backgroundColor:Colors.teal.shade200,
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('https://c8.alamy.com/comp/MNNJEE/sad-emoticon-face-MNNJEE.jpg'), // Add your avatar image URL
            ),
            const SizedBox(height: 20),
            const Text(
              'SahanMax',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Sahan@gmail.com',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Perform logout actions here
                // For example, you can clear user authentication tokens, navigate to login page, etc.
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(), // Navigate to login page after logout
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // Set button background color
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              ),
              child: const Text(
                'Logout',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserPage extends StatelessWidget {
  const UserPage({Key? key, required this.name, required this.email}) : super(key: key);

  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/c/c0/Siddharth_Nigam_snapped_promoting_his_film_Kisi_Ka_Bhai_Kisi_Ki_Jaan_at_Mehboob_Studios_in_Bandra_%28cropped%29.jpg',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Name: $name',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Email: $email',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Welcome to HealHub'),
            _buildSectionDescription(
                'Your companion on the journey to mental well-being.'),
            _buildDivider(),
            _buildSectionTitle('Our Mission'),
            _buildSectionDescription(
                'At HealHub, our mission is to provide accessible and compassionate mental health support to individuals around the world. We believe that everyone deserves access to quality counseling services, and we strive to break down barriers to care by offering a convenient and user-friendly platform.'),
            _buildDivider(),
            _buildSectionTitle('What We Offer'),
            _buildSectionDescription(
                'Experienced Counselors: Our team consists of licensed and accredited counselors with expertise in various areas of mental health and wellness.'),
            _buildSectionDescription(
                'Confidentiality: We prioritize your privacy and confidentiality. Rest assured that your sessions are conducted in a secure and confidential environment.'),
            _buildSectionDescription(
                'Flexible Scheduling: We understand that life can be hectic. That\'s why we offer flexible scheduling options, allowing you to book sessions at a time that works best for you.'),
            _buildSectionDescription(
                'Affordable Rates: Quality mental health care should be accessible to all. We offer competitive rates and strive to make counseling services affordable for everyone.'),
            _buildDivider(),
            _buildSectionTitle('Get Started'),
            _buildSectionDescription(
                'Join the HealHub community today and take the first step towards a healthier, happier you. Whether you\'re struggling with anxiety, depression, relationship issues, or simply need someone to talk to, our counselors are here to support you every step of the way.'),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSectionDescription(String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        description,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Divider(
        color: Colors.teal,
        thickness: 2.0,
      ),
    );
  }
}


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Perform login logic here
                // For example, validate user credentials, authenticate user, etc.
                // If login is successful, navigate to home page
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const HomePage(), // Navigate to home page after successful login
                  ),
                );
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.teal.shade300,
        title: const Text('Contact Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.contact_phone,
              size: 120,
              color: Colors.teal,
            ),
            SizedBox(height: 20),
            Text(
              'Have a question?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Feel free to contact us at:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Phone: 0701111111',
              style: TextStyle(fontSize: 18),
            ),
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
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
