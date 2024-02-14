import 'package:flutter/material.dart';
import 'package:healhub/Screens/sidemenu.dart';

class Hotlines extends StatelessWidget {
  const Hotlines({super.key});

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
  const MyHomePage({super.key, required this.title});

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
        backgroundColor: Colors.green,
        title: Text(widget.title),
      ),
      drawer: const Sidemenu(),
      body: Container(
        color: Colors.green[100], // Light green background
        child: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(contacts[index]["name"]!),
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
