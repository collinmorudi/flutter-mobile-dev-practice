import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController textName = TextEditingController();
  final List<String> _images = ["Lake", "Mountain", "Sea", "Country"];
  String _selectedImage = "Lake";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: textName,
              decoration: const InputDecoration(hintText: "Type your name: "),
            ),
            DropdownButton<String>(
              value: _selectedImage,
              items: _images.map((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value));
              }).toList(),
              onChanged: (newValue) {},
            )
          ],
        ),
      ),
    );
  }
}
