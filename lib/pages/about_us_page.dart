import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Circular Image
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/AboutUsImage.png'), // Replace with your image asset
            ),
            const SizedBox(height: 20),
            // Text about yourself
            const Text(
              'Hi, I\'m Bhupendra!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'I am an app developer with a passion for creating beautiful and functional mobile applications. '
                  'This app is designed to help you build and maintain good habits. Stay motivated and track your progress!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            // Text about the app
            const Text(
              'About the App',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'This app is your companion in building better habits. '
                  'Track your daily habits, stay motivated with progress charts, and share your success with others. Let\'s make every day count!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
