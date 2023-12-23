import 'package:flutter/material.dart';
import 'package:game_time/game.dart';
import 'package:game_time/game_data_controller.dart';

class SearchResults extends StatelessWidget {
  final String searchText;
  final GameDataController gameDataController = GameDataController();
  SearchResults({super.key, required this.searchText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results for $searchText'),
      ),
      body: FutureBuilder<List<Game>>(
        future: gameDataController.fetchGameData(searchText),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Unable to retrieve results: ${snapshot.error}'));
          } else {
            List<Game> games = snapshot.data!;
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
                        games[index].imageURL,
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
                              games[index].name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0),
                            ),
                            const SizedBox(height: 25.0),
                            Text('Main Story: ${games[index].mainTime} hours'),
                            Text(
                                'Main + Extra: ${games[index].extraTime} hours'),
                            Text(
                                'Completionist: ${games[index].completionistTime} hours'),
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
