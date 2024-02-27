import 'package:flutter/material.dart';
import 'package:game_time/game.dart';
import 'package:game_time/game_data_controller.dart';
import 'package:game_time/game_details.dart';

class PopularGames extends StatelessWidget {
  final GameDataController gameDataController = GameDataController();
  PopularGames({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular games'),
      ),
      body: FutureBuilder<List<Game>>(
        future: gameDataController.fetchGameData(),
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
                            Text(
                                'Main Story: ${games[index].mainTime % 1 == 0 ? games[index].mainTime.toInt() : games[index].mainTime} hours'),
                            Text(
                                'Main + Extra: ${games[index].extraTime % 1 == 0 ? games[index].extraTime.toInt() : games[index].extraTime} hours'),
                            Text(
                                'Completionist: ${games[index].completionistTime % 1 == 0 ? games[index].completionistTime.toInt() : games[index].completionistTime} hours'),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            GameDetails(game: games[index])))
                              },
                          icon: const Icon(Icons.arrow_forward_ios_rounded,
                              size: 15))
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
