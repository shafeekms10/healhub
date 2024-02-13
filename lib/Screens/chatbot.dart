import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController controller = ScrollController();
  final List<String> predefinedQuestions = [
    "What is mental health?",
    "What are some common mental health disorders?",
    "Why seek counseling? How does it help?",
    "How can I improve my mental health?",
    "When should I seek help for my mental health?",
    "Is therapy effective for mental health?",
    "Are medications necessary?",
    "Self-care practices for mental health?",
    "Supporting a loved one with mental illness?",
    "How can I reduce stigma surrounding mental illness?          ",
  ];

  List<String> chatMessages = [];
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Chat Bot',
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 150,
            child: Container(
              color: Colors.grey[200],
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Predefined Questions',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  SizedBox(height: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Scrollbar(
                        thumbVisibility: true,
                        thickness: 5,
                        controller: controller,
                        child: SingleChildScrollView(
                          controller: controller,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...predefinedQuestions.map((question) {
                                return InkWell(
                                  onTap: () {
                                    messageController.text = question;
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                                    child: Text(
                                      question,
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: chatMessages.length,
              itemBuilder: (context, index) {
                final message = chatMessages[index];
                final isUserMessage = message.startsWith("User:");
                return Align(
                  alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isUserMessage ? Colors.blue : Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        leading: Icon(
                          isUserMessage ? Icons.person : Icons.android,
                          color: Colors.white,
                        ),
                        title: Text(
                          message,
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: "Type your message here...",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      prefixIcon: Icon(Icons.android), // Robot icon
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    handleSendMessage(messageController.text);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void handleSendMessage(String message) {
    if (message.isNotEmpty) {
      String reply = getReply(message);
      setState(() {
        chatMessages.insert(0, "User:\n$message");
        chatMessages.insert(0, "Bot:\n$reply");
      });
      messageController.clear();
    }
  }

  String getReply(String question) {
    switch (question) {
      case "What is mental health?":
        return "Mental health refers to your emotional, psychological, and social well-being. It affects how you think, feel, and act.";
      case "What are some common mental health disorders?":
        return "Common mental health disorders include depression, anxiety disorders (such as generalized anxiety disorder, panic disorder, and social anxiety disorder), bipolar disorder, schizophrenia, and eating disorders.";   
      case "Why seek counseling? How does it help?":
        return "Counseling provides a safe and confidential space to explore your thoughts, feelings, and experiences with a trained professional. It can help you gain insight into your challenges, develop coping skills, set goals, and work towards positive changes in your life.";
      case "When should I seek help for my mental health?":
        return "You should seek help if you're experiencing symptoms of mental illness that are impacting your daily life, relationships, or overall well-being. It's important to reach out to a mental health professional if you're struggling to cope on your own.";
      case "Is therapy effective for mental health?":
        return "Yes, therapy can be highly effective for treating mental health disorders. Different types of therapy, such as cognitive-behavioral therapy (CBT), dialectical behavior therapy (DBT), and interpersonal therapy, are tailored to address specific symptoms and challenges.";
      case "Supporting a loved one with mental illness?":
        return "You can support a loved one by listening non-judgmentally, offering your presence and empathy, encouraging them to seek professional help, and helping them access resources and support groups.";
      case "Self-care practices for mental health?":
        return "Self-care practices include getting regular exercise, eating a balanced diet, getting enough sleep, practicing relaxation techniques, setting boundaries, engaging in hobbies or activities you enjoy, and spending time with supportive people.";
      case "Are medications necessary?":
        return "Medications can be helpful for managing symptoms of certain mental health disorders, especially when combined with therapy. However, they're not always necessary and should be prescribed and monitored by a qualified healthcare professional.";
      case "How can I reduce stigma surrounding mental illness?          ":
        return "You can reduce stigma by educating yourself and others about mental health, challenging stereotypes and misconceptions, being mindful of the language you use, showing empathy and understanding, and supporting initiatives that promote mental health awareness and acceptance.";
      case "How can I improve my mental health?":
        return "You can improve your mental health by maintaining a healthy lifestyle, seeking support from friends and family, practicing relaxation techniques such as mindfulness or meditation, and seeking professional help if needed.";
      default:
        return "I'm not sure how to respond to that.";

     
   
    }
  }
}
