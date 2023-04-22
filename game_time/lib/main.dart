import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Game time App',
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Game time"),
            ),
            body: const TextField(
              decoration: InputDecoration(
                  labelText: "Search game", prefixIcon: Icon(Icons.search)),
            )));
  }
}
