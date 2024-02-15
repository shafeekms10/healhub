import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healhub/Components/my_button.dart';
import 'package:healhub/Components/my_text_field.dart';
import 'package:healhub/Services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  final void Function()? onTap;
  const SignUp({super.key, required this.onTap});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();

  void signUp() async{
    if(passwordController.text != confirmPasswordController.text){
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Password does not match!'),
          )
      );
      return;
    }

    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signUpWithEmailAndPassword(
          nameController.text,
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
              height: 892,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.teal.shade400, Colors.teal.shade100])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
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
                  const SizedBox(height: 20,),
                  Opacity(
                    opacity: 0.8,
                    child: Container(
                      height: 430,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(17)
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            SizedBox(
                                width: 250,
                                child: MyTextField(
                                  controller: nameController,
                                  hintText: 'Name',
                                  icon: FontAwesomeIcons.user,
                                  obscureText: false,
                                )
                            ),
                            const SizedBox(height: 15,),
                            SizedBox(
                                width: 250,
                                child: MyTextField(
                                  controller: emailController,
                                  hintText: 'Email',
                                  icon: FontAwesomeIcons.envelope,
                                  obscureText: false,
                                )
                            ),
                            const SizedBox(height: 15,),
                            SizedBox(
                                width: 250,
                                child: MyTextField(
                                  controller: passwordController,
                                  hintText: 'Password',
                                  icon: FontAwesomeIcons.lock,
                                  obscureText: true,
                                )
                            ),
                            const SizedBox(height: 15,),
                            SizedBox(
                                width: 250,
                                child: MyTextField(
                                  controller: confirmPasswordController,
                                  hintText: 'Confirm Password',
                                  icon: FontAwesomeIcons.lock,
                                  obscureText: true,
                                )
                            ),
                            const SizedBox(height: 40,),
                            MyButton(onTap: signUp, text: 'Sign Up'),
                            const SizedBox(height: 27,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Already have an account? ',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(width: 5,),
                                GestureDetector(
                                  onTap: widget.onTap,
                                  child: const Text('Sign In',
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
