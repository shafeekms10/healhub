import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healhub/Screens/home_screen.dart';
import 'package:healhub/Screens/signup_screen.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
              height: 892,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.teal.shade400, Colors.teal.shade100])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    height: 220,
                    width: 200,
                    child: Image.asset(
                      'images/Logo.png',
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Text('Heal Hub',
                    style: TextStyle(
                      color: Color(0xFF015141),
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Opacity(
                    opacity: 0.8,
                    child: Container(
                      height: 440,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(17)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            const SizedBox(height: 30,),
                            const SizedBox(height: 10,),
                            const Text('Please Sign In to Your Account',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                              ),
                            ),
                            const SizedBox(height: 20,),
                            const SizedBox(
                              width: 250,
                              child: TextField(
                                style: TextStyle(fontSize: 13),
                                decoration: InputDecoration(
                                  labelText: 'Email Address',
                                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                                  suffixIcon: Icon(FontAwesomeIcons.envelope,size: 17,),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20,),
                            const SizedBox(
                              width: 250,
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                                  suffixIcon: Icon(FontAwesomeIcons.eyeSlash,size: 17,),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(20, 20, 40, 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('Forgot Password?',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              ) ,
                            ),
                            const SizedBox(height: 20,),
                            GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const Home()
                                ));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 250,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                      color: const Color(0xFF006A55),
                                  ),
                                child: const Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Text('Sign In',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 27,),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Don\'t have an account? ',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.pop(context);
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => const SignUp()
                                    ));
                                  },
                                  child: const Text('Sign Up',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF006A55),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ]
                      ),
                    ),
                  )
                ],
              ),
            )
        )
    );
  }
}