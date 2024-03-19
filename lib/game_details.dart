import 'package:flutter/material.dart';
import 'package:game_time/game.dart';
import 'package:url_launcher/url_launcher.dart';

class GameDetails extends StatelessWidget {
  final Game game;

  const GameDetails({super.key, required this.game});

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(game.name)),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
              ),
              SizedBox(
                height: 300,
                width: 300,
                child: Image.network(
                  game.imageURL,
                  fit: BoxFit.contain,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
              ),
              Text(
                game.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              game.alias.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text("Also known as: ${game.alias}"))
                  : Container(),
              const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(8.0)),
                      height: 45,
                      width: 190,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Main",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "${game.mainTime % 1 == 0 ? game.mainTime.toInt() : game.mainTime} hours",
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          )
                        ],
                      )),
                  const SizedBox(
                    height: 20,
                    child: VerticalDivider(
                      color: Colors.black,
                      thickness: 1.0,
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(8.0)),
                      height: 45,
                      width: 190,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Extra",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "${game.extraTime % 1 == 0 ? game.extraTime.toInt() : game.extraTime} hours",
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ))
                ],
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(8.0)),
                      height: 45,
                      width: 190,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Completionist",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "${game.completionistTime % 1 == 0 ? game.completionistTime.toInt() : game.completionistTime} hours",
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          )
                        ],
                      )),
                  const SizedBox(
                    height: 20,
                    child: VerticalDivider(
                      color: Colors.black,
                      thickness: 1.0,
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(8.0)),
                      height: 45,
                      width: 190,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "All Styles",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "${game.allStyles % 1 == 0 ? game.allStyles.toInt() : game.allStyles} hours",
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
                width: 340,
                child: Divider(
                  color: Colors.black,
                  thickness: 1.0,
                ),
              ),
              Container(
                  width: 400,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.amber[50],
                      border: Border.all(color: Colors.amber),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          offset: const Offset(2, 2),
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Developer: \n",
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        game.developer,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 20,
                        width: 340,
                        child: Divider(
                          color: Colors.black,
                          thickness: 1.0,
                        ),
                      ),
                      const Text(
                        "Platforms: \n",
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        game.platforms.length > 1
                            ? game.platforms.join(', ')
                            : game.platforms[0],
                        overflow: TextOverflow.clip,
                        maxLines: 4,
                      ),
                      const SizedBox(
                        height: 20,
                        width: 340,
                        child: Divider(
                          color: Colors.black,
                          thickness: 1.0,
                        ),
                      ),
                      Text("Release: ${game.releaseYear}"),
                      const SizedBox(
                        height: 20,
                        width: 340,
                        child: Divider(
                          color: Colors.black,
                          thickness: 1.0,
                        ),
                      ),
                      Text("Review Score: ${game.reviewScore}"),
                      const SizedBox(
                        height: 20,
                        width: 340,
                        child: Divider(
                          color: Colors.black,
                          thickness: 1.0,
                        ),
                      ),
                      Text("Genre: ${game.gameType}"),
                    ],
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 9.0),
                  child: Center(
                      child: ElevatedButton(
                          onPressed: () async {
                            final Uri uri = Uri.parse(game.webLink);

                            if (!await launchUrl(uri,
                                mode: LaunchMode.externalApplication)) {
                              throw "Unable to launch HowLongToBeat's website";
                            }
                          },
                          child: const Text("Visit HowLongToBeat")))),
            ],
          ),
        ));
  }
}
