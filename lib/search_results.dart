import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchResults extends StatelessWidget {
  final String searchText;
  const SearchResults({super.key, required this.searchText});

  Future<List<Map<String, dynamic>>> fetchGameData() async {
    final response = await http.get(
        Uri.parse('https://ken095.alwaysdata.net/find-game/${searchText}'));

    List<dynamic> jsonData = json.decode(response.body)['HLTB'];
    List<Map<String, dynamic>> games =
        List<Map<String, dynamic>>.from(jsonData);
    // print(games);
    // for (Map<String, dynamic> game in games) {
    //   print('Game Name: ${game["game_name"]}' + "\n");
    //   print('Game Developer: ${game["game_developer"]}' + "\n");

    //   print('Game Release: ${game["game_release"]}' + "\n");

    return games;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results for $searchText'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchGameData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Unable to retrieve results: ${snapshot.error}');
          } else {
            List<Map<String, dynamic>> games = snapshot.data!;
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: games.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(6.0),
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  child: Row(
                    children: [
                      Image.network(
                        games[index]['game_image_url'],
                        height: 110,
                        width: 75,
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5.0),
                            Text(
                              games[index]['game_name'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0),
                            ),
                            const SizedBox(height: 25.0),
                            Text('Main Story: ${games[index]['game_main']}'),
                            Text('Main + Extra: ${games[index]['game_extra']}'),
                            Text(
                                'Completionist: ${games[index]['game_completionist']}'),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios_rounded, size: 15),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
