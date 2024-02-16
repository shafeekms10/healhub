import 'package:flutter/material.dart';
import 'package:healhub/Screens/Client/sidemenu.dart';
import 'package:url_launcher/url_launcher.dart';

class Resources extends StatelessWidget {
  const Resources({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Resources'),
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
  final List<Map<String, String>> mentalHealthResources = [
    {
      "description": "How to Overcome Mental Health Crisis | Sadhguru",
      "url": "https://www.youtube.com/watch?v=HRXrfIvRzNY",
    },
    {
      "description": "Jordan Peterson's Advice For People With Depression",
      "url": "https://www.youtube.com/watch?v=VlDgowUAyx4",
    },
    {
      "description": "Jordan Peterson: How To Deal With Depression | Powerful Motivational Speech",
      "url": "https://www.youtube.com/watch?v=Xm_2zmX6Akc",
    },
    {
      "description": "We All Have Mental Health by Anna Freud",
      "url": "http://www.youtube.com/watch?v=DxIDKZHW3-E",
    },
    {
      "description": "5 Ways to Help Someone Struggling with Their Mental Health | Mental Health Season - BBC Ideas by BBC",
      "url": "http://www.youtube.com/watch?v=wIUcc8g17wg",
    },
    {
      "description": "Sleep and Mental Health by Psych Hub",
      "url": "http://www.youtube.com/watch?v=RGaG-7RoH7w",
    },
    {
      "description": "Physical and Mental Health by Psych Hub",
      "url": "http://www.youtube.com/watch?v=EKEWk4oWmjY",
    },
    {
      "description": "Talking Mental Health by Anna Freud",
      "url": "http://www.youtube.com/watch?v=nCrjevx3-Js",
    },
    {
      "description": "Matt D'Avella: Do Less, Live More",
      "url": "https://m.youtube.com/watch?v=BB8o8-EdZY0",
    },
    {
      "description": "Mel Robbins: The 5 Second Rule",
      "url": "https://www.youtube.com/watch?v=dUuEP7Ghiyk",
    },
    {
      "description": "Simon Sinek: Start With Why",
      "url": "https://www.youtube.com/watch?v=u4ZoJKF_VuA&vl=en",
    },
    {
      "description": "The School of Life: How to be a Friend to Yourself",
      "url": "https://www.youtube.com/watch?v=ERhTJaPaoxU",
    },
    {
      "description": "Tara Brach: Radical Compassion",
      "url": "https://m.youtube.com/watch?v=u3nMF54MnJo",
    },
    {
      "description": "Headspace: How to Meditate",
      "url": "https://www.youtube.com/watch?v=iN6g2mr0p3Q",
    },
    {
      "description": "BrenÈ Brown: The Power of Vulnerability",
      "url": "https://www.youtube.com/watch?v=iCvmsMzlF7o",
    },
    {
      "description": "Seth Godin: The Dip",
      "url": "https://m.youtube.com/watch?v=1koS0t8t5_s",
    },
    {
      "description": "Yuval Noah Harari: 21 Lessons for the 21st Century",
      "url": "https://m.youtube.com/watch?v=Bw9P_ZXWDJU",
    },
    // Add more resources here following the same structure if needed
  ];



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // In your AppBar widget inside the Scaffold
        appBar: AppBar(
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
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
            // AppBar title in white
          ),
          bottom: TabBar(
            labelColor: Colors.black,
            // Active tab title in white
            unselectedLabelColor: Colors.teal[200], // Inactive tab title in lighter green for contrast
            indicator: BoxDecoration(
              color: Colors.teal[200], // Darker green color for the active tab background
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            tabs: const [
              Tab(
                // Use a Text widget to customize the tab's text appearance
                child: Text(
                  '           YouTube                   ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,// Make the text bold
                    color: Colors.black, // This color will be overridden by labelColor and unselectedLabelColor
                  ),
                ),
              ),
              Tab(
                child: Text(
                  '             Books                  ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,// Make the text bold
                    color: Colors.black, // This color will be overridden by labelColor and unselectedLabelColor
                  ),
                ),
              ),
            ],
          ),
        ),
        drawer: Sidemenu(),

        body: TabBarView(
          children: [
            _buildMentalHealthTab(),
            _buildTabContent(), // Your content for the second tab
          ],
        ),
      ),
    );
  }


  Widget _buildMentalHealthTab() {
    return ListView.builder(
      itemCount: mentalHealthResources.length,
      itemBuilder: (context, index) {
        final item = mentalHealthResources[index];
        return Card(
          color: Colors.teal[400],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.all(8),
          child: ListTile(
            title: Text(item["description"] ?? "No Description"),
            onTap: () => _launchURL(item["url"] ?? ""),
          ),
        );
      },
    );
  }

  Widget _buildTabContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
            elevation: 4,
            margin: const EdgeInsets.all(8),
            color: Colors.teal[400], // Set card background to green
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Books:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Set text color to white for contrast
                    ),
                  ),
                  Text("ï \"Man's Search for Meaning\" by Viktor Frankl", style: TextStyle(color: Colors.black)),
                  Text("ï \"The Gifts of Imperfection\" by BrenÈ Brown", style: TextStyle(color: Colors.black)),
                  Text("ï \"Daring Greatly\" by BrenÈ Brown", style: TextStyle(color: Colors.black)),
                  Text("ï \"The Power of Vulnerability\" by BrenÈ Brown", style: TextStyle(color: Colors.black)),
                  Text("ï \"How to Cope with Anxiety and Depression\" by Mark Goulston", style: TextStyle(color: Colors.black)),
                  Text("ï \"Mindfulness Meditation for Beginners\"", style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
          ),
          Card(
            elevation: 4,
            margin: const EdgeInsets.all(8),
            color: Colors.teal[400], // Set card background to green
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Apps:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Set text color to white for contrast
                    ),
                  ),
                  Text("ï Calm", style: TextStyle(color: Colors.black)),
                  Text("ï Headspace", style: TextStyle(color: Colors.black)),
                  Text("ï Talkspace", style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  Future<void> _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }
}

