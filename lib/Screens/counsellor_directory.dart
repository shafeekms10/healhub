import 'package:flutter/material.dart';
import 'package:healhub/Screens/sidemenu.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Directory(),
    );
  }
}

class Counselor {
  final String name;
  final String job;
  final String photoUrl;
  final String email;
  final String phoneNumber;
  final String bio;


  Counselor({
    required this.name,
    required this.job,
    required this.photoUrl,
    required this.email,
    required this.phoneNumber,
    required this.bio,

  });
}

class Directory extends StatefulWidget {
  const Directory({super.key});

  @override
  _DirectoryState createState() => _DirectoryState();
}

class _DirectoryState extends State<Directory> {
  late List<Counselor> counselors;
  late List<Counselor> filteredCounselors;

  @override
  void initState() {
    super.initState();
    counselors = [
      Counselor(
        name: 'John Doe',
        job: 'Psychologist',
        photoUrl:
        'https://media.istockphoto.com/id/1346124900/photo/confident-successful-mature-doctor-at-hospital.jpg?s=612x612&w=0&k=20&c=S93n5iTDVG3_kJ9euNNUKVl9pgXTOdVQcI_oDGG-QlE=',
        email: 'john@gmail.com',
        phoneNumber: '123-456-7890',
        bio:
        'John Doe is a licensed psychologist with over 15 years of experience working with individuals, couples, and families. He specializes in treating mood disorders, such as depression and bipolar disorder, as well as relationship issues and trauma recovery. John employs a variety of therapeutic modalities, including cognitive-behavioral therapy (CBT), dialectical behavior therapy (DBT), and mindfulness techniques, to help his clients achieve positive outcomes. He is committed to providing compassionate and evidence-based care to support his clients\' mental health and well-being.',
      ),
      Counselor(
        name: 'Jane Smith',
        job: 'Therapist',
        photoUrl:
        'https://www.shutterstock.com/image-photo/headshot-successful-smiling-cheerful-african-600nw-567772042.jpg',
        email: 'jane@gmail.com',
        phoneNumber: '987-654-3210',
        bio:
        'Jane Smith is a compassionate therapist with over 10 years of experience specializing in cognitive behavioral therapy (CBT). She is dedicated to helping individuals overcome challenges such as anxiety, depression, and stress by providing personalized therapy sessions tailored to each client\'s unique needs. Jane creates a supportive and non-judgmental environment where clients feel empowered to explore their thoughts and emotions, develop coping strategies, and achieve their therapeutic goals. Her compassionate approach, combined with her expertise in CBT techniques, has helped numerous clients lead happier and more fulfilling lives.',
      ),
      Counselor(
        name: 'David Johnson',
        job: 'Counselor',
        photoUrl:
        'https://img.freepik.com/free-photo/elegant-businessman-office_155003-9641.jpg',
        email: 'david@gmail.com',
        phoneNumber: '555-555-5555',
        bio:
        'David Johnson is a licensed counselor specializing in holistic wellness and personal growth. With a background in counseling psychology and holistic health practices, David takes a holistic approach to therapy, addressing the interconnectedness of mind, body, and spirit. He works collaboratively with his clients to explore their values, strengths, and goals, and supports them in creating positive changes in all areas of their lives. David integrates mindfulness, relaxation techniques, and holistic lifestyle strategies into his counseling sessions to promote overall well-being and resilience. He is passionate about empowering his clients to live authentically and find fulfillment in their lives.',
      ),
    ];

    filteredCounselors = List.from(counselors);
  }

  void filterCounselors(String query) {
    setState(() {
      filteredCounselors = counselors
          .where((counselor) =>
          counselor.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Counselor Directory',
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
        body: Column(
          children: [
            Container(
              color: const Color.fromARGB(212, 189, 228, 211),
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {
                  filterCounselors(value);
                },
              ),
            ),
            Expanded(
              child: Container(
                color: const Color.fromARGB(212, 189, 228, 211),
                child: ListView.builder(
                  itemCount: filteredCounselors.length,
                  itemBuilder: (context, index) {
                    final counselor = filteredCounselors[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                            NetworkImage(counselor.photoUrl),
                            radius: 45,
                          ),
                          title: Text(
                            counselor.name,
                            style: const TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(counselor.job),
                          onTap: () {
                            // Navigate to counselor profile
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CounselorProfileScreen(counselor: counselor),
                              ),
                            );
                          },
                        ),
                        const Divider(), // Add a divider between counselors
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CounselorProfileScreen extends StatelessWidget {
  final Counselor counselor;

  const CounselorProfileScreen({super.key, required this.counselor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Counselor Profile',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(counselor.photoUrl),
                ),
                const SizedBox(height: 20),
                Text(
                  counselor.name,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  counselor.job,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),
                ListTile(
                  leading: const Icon(Icons.email),
                  title: Text(counselor.email),
                ),
                ListTile(
                  leading: const Icon(Icons.phone),
                  title: Text(counselor.phoneNumber),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Bio:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  counselor.bio,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async{
                    await launchUrlString("https://zcal.co/i/vuc6XAJm");
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => TimeSlotsScreen(counselor: counselor),
                    //   ),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 6, 120, 97),
                  ),
                  child: const Text(
                    'Schedule a Meeting',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class TimeSlotsScreen extends StatefulWidget {
//   final Counselor counselor;
//
//   TimeSlotsScreen({required this.counselor});
//
//   @override
//   _TimeSlotsScreenState createState() => _TimeSlotsScreenState();
// }
//
// class _TimeSlotsScreenState extends State<TimeSlotsScreen> {
//   Map<String, bool> bookedSlots = {};
//
//   @override
//   void initState() {
//     super.initState();
//     for (var entry in widget.counselor.availableTimeSlots) {
//       entry.entries.forEach((e) {
//         e.value.forEach((slot) {
//           bookedSlots[slot] = false;
//         });
//       });
//     }
//   }

  // void bookSlot(String timeSlot) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Confirm Booking'),
  //         content: Text('Are you sure you want to book the time slot $timeSlot of ${widget.counselor.name}?'),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: Text('No'),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               setState(() {
  //                 bookedSlots[timeSlot] = true;
  //               });
  //               Navigator.of(context).pop(); // Close the confirmation dialog
  //               showBookingConfirmationDialog(timeSlot);
  //             },
  //             child: Text('Yes'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // void showBookingConfirmationDialog(String timeSlot) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Booking Confirmation'),
  //         content: Text('You have successfully booked the time slot $timeSlot of ${widget.counselor.name}.'),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: Text('OK'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

//   @override
//   Widget build(BuildContext context) {
//     // Extracting all available time slots for the counselor
//     final List<Map<String, List<String>>> allTimeSlots = widget.counselor.availableTimeSlots;
//
//     // Sorting the time slots by date
//     allTimeSlots.sort((a, b) => a.keys.first.compareTo(b.keys.first));
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Available Time Slots',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         flexibleSpace: Opacity(
//           opacity: 0.7,
//           child: Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Colors.teal.shade400, Colors.teal.shade100],
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 20),
//               Text(
//                 'Time Slots for ${widget.counselor.name}',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 20),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   for (var dateSlot in allTimeSlots)
//                     ...dateSlot.entries.map((entry) {
//                       return Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             '${entry.key}',
//                             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(height: 10),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               for (var timeSlot in entry.value)
//                                 ListTile(
//                                   title: Text(timeSlot),
//                                   trailing: bookedSlots.containsKey(timeSlot) && bookedSlots[timeSlot]!
//                                       ? Text('Booked', style: TextStyle(color: Colors.red))
//                                       : ElevatedButton(
//                                     onPressed: () {
//                                       if (!bookedSlots.containsKey(timeSlot) || !bookedSlots[timeSlot]!) {
//                                         bookSlot(timeSlot);
//                                       }
//                                     },
//                                     child: Text(
//                                       'Book',
//                                       style: TextStyle(color: Colors.black),
//                                     ),
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor: Colors.lightBlue,
//                                     ),
//                                   ),
//                                 ),
//                             ],
//                           ),
//                           SizedBox(height: 20),
//                         ],
//                       );
//                     }).toList(),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }