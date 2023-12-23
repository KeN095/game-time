import "package:game_time/game.dart";
import 'package:http/http.dart' as http;
import 'dart:convert';

class GameDataController {
  Future<List<Game>> fetchGameData(String searchText) async {
    final response = await http
        .get(Uri.parse('https://ken095.alwaysdata.net/find-game/$searchText'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body)['HLTB'];
      final List<Map<String, dynamic>> jsonGames =
          List<Map<String, dynamic>>.from(jsonData);
      // print(games);
      // for (Map<String, dynamic> game in games) {
      //   print('Game Name: ${game["game_name"]}' + "\n");
      //   print('Game Developer: ${game["game_developer"]}' + "\n");

      //   print('Game Release: ${game["game_release"]}' + "\n");

      // Process raw data into a list of Game instances
      final List<Game> games = jsonGames.map((jsonGame) {
        return Game.jsonToObj(jsonGame);
      }).toList();

      return games;
    } else {
      throw Exception('Failed to load game data');
    }
  }
}
