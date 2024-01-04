import 'package:flutter/material.dart';
import 'package:game_time/popular_games.dart';
import 'search_results.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Game time App', home: Homescreen());
  }
}

class Homescreen extends StatelessWidget {
  Homescreen({super.key});

  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Game time"),
        ),
        body: Center(
            child: SizedBox(
                width: 300,
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: "Search game",
                      prefixIcon: const Icon(Icons.search)),
                  onSubmitted: (value) => {
                    if (value == "popular")
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PopularGames()))
                      }
                    else
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchResults(
                                    searchText: _searchController.text)))
                      }
                  },
                ))));
  }
}
