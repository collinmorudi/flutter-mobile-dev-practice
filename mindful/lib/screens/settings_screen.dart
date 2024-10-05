import 'package:flutter/material.dart';
import 'package:mindful/data/sp_helper.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController textName = TextEditingController();
  final List<String> _images = ["Lake", "Mountain", "Sea", "Country"];
  String _selectedImage = "Lake";
  final SPHelper helper = SPHelper();

  @override
  void initState() {
    super.initState();
    getSettings();
  }

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
                return DropdownMenuItem(value: value, child: Text(value));
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedImage = newValue ?? "Lake";
                });
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          saveSetting().then((value) {
            String message = value
                ? "Settings saved successfully!"
                : "Error: Settings were not saved!";
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(message),
              duration: const Duration(seconds: 3),
            ));
          });
        },
        child: const Icon(Icons.save),
      ),
    );
  }

  Future<bool> saveSetting() async {
    return await helper.setSettings(String, textName.text, _selectedImage);
  }

  Future<void> getSettings() async {
    Map<String, String> settings = await helper.getSettings();
    _selectedImage = settings["image"] ?? "Lake";

    // Check if the image value exists in the _images list
    String? image = settings["image"];
    if (_images.contains(image)) {
      _selectedImage = image!;
    } else {
      _selectedImage = "Lake"; // Default to "Lake" if invalid value is returned
    }

    textName.text = settings["name"] ?? "";

    setState(() {});
  }

  // cleanup
  @override
  void dispose() {
    textName.dispose();
    super.dispose();
  }
}
