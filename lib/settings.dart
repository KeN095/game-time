import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListTile(
        title: const Text("About"),
        leading: const Icon(Icons.info_outline),
        onTap: () => showDialog(
          context: context,
          builder: (context) => const AboutDialog(
            applicationName: 'Game Time',
            children: [
              // Additional info you want to display in the dialog
              Text("An unofficial HowLongtoBeat app"),
              Text("All rights belong to HowLongToBeat")
            ],
          ),
        ),
      ),
    );
  }
}
