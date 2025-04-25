import 'package:flutter/material.dart';
import 'package:game_time/game.dart';
import 'package:url_launcher/url_launcher.dart';

class GameDetails extends StatefulWidget {
  final Game game;

  const GameDetails({super.key, required this.game});

  @override
  State<GameDetails> createState() => _GameDetailsState();
}

class _GameDetailsState extends State<GameDetails> {
  late bool added;

  @override
  void initState() {
    super.initState();
    added = false;
  }

  @override
  Widget build(BuildContext context) {
    String backlogTitle = added
        ? "Remove ${widget.game.name} from backlog"
        : "Add ${widget.game.name} to backlog";
    //backlogTitle is the text used for the title for the text widget below
    String backlogStatus = added
        ? "Removed ${widget.game.name} from your backlog"
        : "Added ${widget.game.name} to your backlog";
    //backlogStatus is the string used for snackbar
    var addGameSnackBar = SnackBar(
      content: Text(backlogStatus),
      elevation: 38.0,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      backgroundColor: Colors.black.withAlpha(230),
      duration: const Duration(seconds: 2),
    );
    return Scaffold(
        appBar: AppBar(title: Text(widget.game.name)),
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
                  widget.game.imageURL,
                  fit: BoxFit.contain,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
              ),
              Text(
                widget.game.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              widget.game.alias.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text("Also known as: ${widget.game.alias}"))
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
                            "${widget.game.mainTime % 1 == 0 ? widget.game.mainTime.toInt() : widget.game.mainTime} hours",
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
                            "${widget.game.extraTime % 1 == 0 ? widget.game.extraTime.toInt() : widget.game.extraTime} hours",
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
                            "${widget.game.completionistTime % 1 == 0 ? widget.game.completionistTime.toInt() : widget.game.completionistTime} hours",
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
                            "${widget.game.allStyles % 1 == 0 ? widget.game.allStyles.toInt() : widget.game.allStyles} hours",
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
                        widget.game.developer,
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
                        widget.game.platforms.length > 1
                            ? widget.game.platforms.join(', ')
                            : widget.game.platforms[0],
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
                      Text("Release: ${widget.game.releaseYear}"),
                      const SizedBox(
                        height: 20,
                        width: 340,
                        child: Divider(
                          color: Colors.black,
                          thickness: 1.0,
                        ),
                      ),
                      Text("Review Score: ${widget.game.reviewScore}"),
                      const SizedBox(
                        height: 20,
                        width: 340,
                        child: Divider(
                          color: Colors.black,
                          thickness: 1.0,
                        ),
                      ),
                      Text("Genre: ${widget.game.gameType}"),
                    ],
                  )),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(backlogTitle),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(addGameSnackBar);
                            added = !added;
                          });
                        },
                        icon: added
                            ? const Icon(Icons.bookmark_remove_outlined)
                            : const Icon(Icons.bookmark_add_outlined),
                        tooltip: "Add this game to your backlog",
                      )
                    ],
                  )),
              const SizedBox(
                height: 20,
                width: 340,
                child: Divider(
                  color: Colors.black,
                  thickness: 1.0,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 9.0),
                  child: Center(
                      child: ElevatedButton(
                          onPressed: () async {
                            final Uri uri = Uri.parse(widget.game.webLink);

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
