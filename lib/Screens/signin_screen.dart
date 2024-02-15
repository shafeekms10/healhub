import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healhub/Components/my_button.dart';
import 'package:healhub/Components/my_text_field.dart';
import 'package:healhub/Services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  final void Function()? onTap;
  const SignIn({super.key, required this.onTap});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn() async {
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithEmailAndPassword(
          emailController.text,
          passwordController.text
      );
    }
    catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.teal.shade400, Colors.teal.shade100])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 220,
                    width: 200,
                    child: Image.asset(
                      'assets/images/Logo.png',
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
                  const SizedBox(height: 35,),
                  Opacity(
                    opacity: 0.8,
                    child: Container(
                      height: 410,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(17)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            const SizedBox(height: 10,),
                            const Text('Please Sign In to Your Account',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                              ),
                            ),
                            const SizedBox(height: 20,),
                            SizedBox(
                              width: 250,
                              child: MyTextField(
                                  controller: emailController,
                                  hintText: 'Email',
                                  icon: FontAwesomeIcons.envelope,
                                  obscureText: false,
                              )
                            ),
                            const SizedBox(height: 20,),
                            SizedBox(
                              width: 250,
                              child: MyTextField(
                                controller: passwordController,
                                hintText: 'Password',
                                icon: FontAwesomeIcons.lock,
                                obscureText: true,
                              )
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
                            const SizedBox(height: 10,),
                            MyButton(onTap: signIn, text: 'Sign In'),
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
                                const SizedBox(width: 5,),
                                GestureDetector(
                                  onTap: widget.onTap,
                                  child: const Text('Sign Up',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF006A55),
                                      ),
                                    ),
                                ),
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
