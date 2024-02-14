import 'package:flutter/material.dart';
import 'package:healhub/Screens/sidemenu.dart';

class Hotlines extends StatelessWidget {
  const Hotlines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Emergency Hotline'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  // Sample list of contacts
  final List<Map<String, String>> contacts = [
    {"name": "Sri Lanka Sumithrayo", "number": "+9411 267 4436"},
    {"name": "Bob", "number": "+1 987 654 321"},
    {"name": "Charlie", "number": "+1 543 216 789"},
    // Add more contacts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Emergency Hotline',
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
        color: const Color.fromARGB(212, 189, 228, 211), // Light green background
        child: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                contacts[index]["name"]!,
                style: const TextStyle(fontWeight: FontWeight.bold), // Make the name bold
              ),
              subtitle: Text(contacts[index]["number"]!),
              leading: CircleAvatar(
                child: Text(contacts[index]["name"]![0]), // Display the first letter of the name
              ),
            );
          },
        ),
      ),
    );
  }
}
