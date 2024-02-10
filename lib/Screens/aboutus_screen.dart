import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Welcome to HealHub'),
            _buildSectionDescription(
                'Your companion on the journey to mental well-being.'),
            _buildDivider(),
            _buildSectionTitle('Our Mission'),
            _buildSectionDescription(
                'At HealHub, our mission is to provide accessible and compassionate mental health support to individuals around the world. We believe that everyone deserves access to quality counseling services, and we strive to break down barriers to care by offering a convenient and user-friendly platform.'),
            _buildDivider(),
            _buildSectionTitle('What We Offer'),
            _buildSectionDescription(
                'Experienced Counselors: Our team consists of licensed and accredited counselors with expertise in various areas of mental health and wellness.'),
            _buildSectionDescription(
                'Confidentiality: We prioritize your privacy and confidentiality. Rest assured that your sessions are conducted in a secure and confidential environment.'),
            _buildSectionDescription(
                'Flexible Scheduling: We understand that life can be hectic. That\'s why we offer flexible scheduling options, allowing you to book sessions at a time that works best for you.'),
            _buildSectionDescription(
                'Affordable Rates: Quality mental health care should be accessible to all. We offer competitive rates and strive to make counseling services affordable for everyone.'),
            _buildDivider(),
            _buildSectionTitle('Get Started'),
            _buildSectionDescription(
                'Join the HealHub community today and take the first step towards a healthier, happier you. Whether you\'re struggling with anxiety, depression, relationship issues, or simply need someone to talk to, our counselors are here to support you every step of the way.'),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSectionDescription(String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        description,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Divider(
        color: Colors.teal,
        thickness: 2.0,
      ),
    );
  }
}