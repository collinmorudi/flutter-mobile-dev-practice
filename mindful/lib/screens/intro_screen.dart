import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mindful"),
      ),
      body: const Center(
        child: Text(
          "Welcome to Mindful App",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
