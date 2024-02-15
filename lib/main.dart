
import 'package:flutter/material.dart';
import 'package:healhub/Services/auth/auth_gate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:healhub/Services/auth/auth_service.dart';
import 'package:healhub/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
    create: (context) => AuthService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HealHub',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const AuthGate(),
    );
  }
}
