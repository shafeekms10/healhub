import 'package:flutter/material.dart';
import 'package:healhub/Screens/sidemenu.dart';

class Hotlines extends StatelessWidget {
  const Hotlines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
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
    {"name": "Sumithrayo", "number": "+9411 269 6666"},
    {"name": "Shanthi Maargam", "number": "+9471 763 9898"},
    {"name": "CCCline", "number": "1333"},
    {"name": "National Institute of Mental Health, Sri Lanka", "number": "1926"},
    {"name": "Sri Lanka Sumithrayo - Bandarawela", "number": "+9457 222 3333"},

    {"name": "Mental Health Support Line", "number": "+9411 234 5678"},
    {"name": "Crisis Helpline", "number": "+9411 987 6543"},
    {"name": "Youth Support Line", "number": "+9411 345 6789"},
    {"name": "Emotional Support Service", "number": "+9411 567 8901"},
    {"name": "Counseling Center Hotline", "number": "+9411 678 9012"},
    {"name": "Well-being Support", "number": "+9411 789 0123"},
    {"name": "Emergency Mental Health Line", "number": "+9411 890 1234"},
    // Ensure to validate and update these contacts
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
