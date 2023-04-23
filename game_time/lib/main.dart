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
            body: Center(
                child: SizedBox(
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelText: "Search game",
                          prefixIcon: const Icon(Icons.search)),
                    )))));
  }
}
