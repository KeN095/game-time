import 'package:flutter/material.dart';
import 'package:game_time/game.dart';
import 'package:game_time/game_data_controller.dart';
import 'package:game_time/game_details.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  GameDataController gameDataController = GameDataController();
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
                child: SizedBox(
                    height: 40,
                    width: 347,
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(55.0),
                          ),
                          contentPadding: const EdgeInsets.only(bottom: 10.0),
                          hintText: "Search game",
                          prefixIcon: const Icon(Icons.search)),
                      onSubmitted: (value) => {
                        {setState(() {})}
                      },
                    )))),
        body: _searchController.text != ""
            ? FutureBuilder<List<Game>>(
                future:
                    gameDataController.fetchGameData(_searchController.text),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text(
                            'Unable to retrieve results: ${snapshot.error}'));
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
                            image: DecorationImage(
                                image: NetworkImage(games[index].imageURL),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.white.withOpacity(0.9),
                                    BlendMode.srcOver)),
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
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0),
                                    ),
                                    const SizedBox(height: 25.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Text('Main Story: '),
                                        Container(
                                            padding: const EdgeInsets.all(3.0),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color:
                                                    games[index].mainTime > 0.0
                                                        ? Colors.blue
                                                        : Colors.grey),
                                            child: Text(
                                              '${games[index].mainTime % 1 == 0 ? games[index].mainTime.toInt() : games[index].mainTime} hours',
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ))
                                      ],
                                    ),
                                    Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 5.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Text('Main + Extra: '),
                                            Container(
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        games[index].mainTime >
                                                                0.0
                                                            ? Colors.blue
                                                            : Colors.grey),
                                                child: Text(
                                                  '${games[index].extraTime % 1 == 0 ? games[index].extraTime.toInt() : games[index].extraTime} hours',
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ))
                                          ],
                                        )),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Text('Completionist: '),
                                        Container(
                                            padding: const EdgeInsets.all(3.0),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color:
                                                    games[index].mainTime > 0.0
                                                        ? Colors.blue
                                                        : Colors.grey),
                                            child: Text(
                                              '${games[index].completionistTime % 1 == 0 ? games[index].completionistTime.toInt() : games[index].completionistTime} hours',
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                  onPressed: () => {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    GameDetails(
                                                        game: games[index])))
                                      },
                                  icon: const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 15))
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
              )
            : const Center(
                child: Text("Results will appear here",
                    style: TextStyle(
                        color: Colors.grey, fontStyle: FontStyle.italic))));
  }
}
