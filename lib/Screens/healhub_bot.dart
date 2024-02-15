import 'package:flutter/material.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'dart:io';
import 'package:healhub/Screens/sidemenu.dart';

class Chatbot extends StatelessWidget {
  const Chatbot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HealHubBot',
      theme: ThemeData(
        brightness: Brightness.light
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HealHub_Bot',
          style: TextStyle(fontWeight: FontWeight.bold)
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
      body: Column(
        children: [
          Expanded(child: MessagesScreen(messages: messages)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Message",
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black
                          )
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.black)),
                        prefixIcon: const Icon(Icons.android), // Robot icon
                      ),
                      style: const TextStyle(color: Colors.black,fontSize: 17),
                    )
                ),
                IconButton(
                    onPressed: () {
                      sendMessage(_controller.text);
                      _controller.clear();
                    },
                    icon: const Icon(Icons.send))
              ],
            ),
          )
        ],
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      stdout.write('Message is empty\n');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}

class MessagesScreen extends StatefulWidget {
  final List messages;
  const MessagesScreen({Key? key, required this.messages}) : super(key: key);

  @override
  MessagesScreenState createState() => MessagesScreenState();
}

class MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: widget.messages[index]['isUserMessage']
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: const Radius.circular(
                            20,
                          ),
                          topRight: const Radius.circular(20),
                          bottomRight: Radius.circular(
                              widget.messages[index]['isUserMessage'] ? 0 : 20),
                          topLeft: Radius.circular(
                              widget.messages[index]['isUserMessage'] ? 20 : 0),
                        ),
                        color: widget.messages[index]['isUserMessage']
                            ? Colors.teal.shade400
                            : Colors.teal.shade700),
                    constraints: BoxConstraints(maxWidth: w * 2 / 3),
                    child:
                    Text(widget.messages[index]['message'].text.text[0],
                      style: const TextStyle(
                        color: Colors.white, fontSize: 15
                      ),
                    )
                ),
              ],
            ),
          );
        },
        separatorBuilder: (_, i) => const Padding(padding: EdgeInsets.only(top: 10)),
        itemCount: widget.messages.length);
  }
}





