import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healhub/Screens/Client/sidemenu.dart';


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Feedback Form'),
          flexibleSpace: Opacity(
            opacity: 0.7,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal.shade400, Colors.teal.shade100],
                ),
              ),
            ),
          ),// Dark green AppBar
        ),

        drawer: const Sidemenu(),
        backgroundColor: Colors.teal.shade50,
        body: Container(
          decoration: BoxDecoration(
            color: Colors.teal.shade50, // Your desired background color
            boxShadow: [
              BoxShadow(
                color: Colors.black
                    .withOpacity(0.2), // Shadow color with some transparency
                spreadRadius: 1, // Spread radius
                blurRadius: 3, // Blur radius
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal.shade800, // Button color
                foregroundColor: Colors.white, // Text color
              ),
              child: const Text('Give Feedback'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const FeedbackDialog(),
                );
              },
            ),
          ),
        ));
  }
}

class FeedbackDialog extends StatefulWidget {
  const FeedbackDialog({Key? key}) : super(key: key);

  @override
  State<FeedbackDialog> createState() => _FeedbackDialogState();
}

class _FeedbackDialogState extends State<FeedbackDialog> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _controller,
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            hintText: 'Enter your feedback regarding the app here',
            filled: true,
          ),
          maxLines: 5,
          maxLength: 4096,
          textInputAction: TextInputAction.done,
          validator: (String? text) {
            if (text == null || text.isEmpty) {
              return 'Please enter a value';
            }
            return null;
          },
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Send'),
          onPressed: () async {
            // Only if the input form is valid (the user has entered text)
            if (_formKey.currentState!.validate()) {
              // We will use this var to show the result
              // of this operation to the user
              String message;

              try {
                // Get a reference to the `newFeedback` collection
                final collection = FirebaseFirestore.instance.collection('feedback');

                // Write the server's timestamp and the user's feedback
                await collection.doc().set({
                  'timestamp': FieldValue.serverTimestamp(),
                  'feedback': _controller.text,
                });

                message = 'Feedback sent successfully';
              } catch (e) {
                message = 'Error when sending feedback';
              }

              // Show a snackbar with the result
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(message)));
              Navigator.pop(context);
            }
          },

        )
      ],
    );
  }
}

