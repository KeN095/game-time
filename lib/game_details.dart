import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  Widget buildBadge(String platform) {
    switch (platform) {
      case 'PlayStation 5':
        return Container(
            width: 65,
            height: 25,
            padding: EdgeInsets.only(left: 4, right: 4),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20)),
            child: SvgPicture.asset(
              'assets/badges/Playstation 5.svg',
            ));
      case 'PlayStation 4':
        return Container(
            width: 65,
            height: 25,
            padding: EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 87, 166),
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(20)),
            child: SvgPicture.asset('assets/badges/Playstation 4.svg',
                fit: BoxFit.contain));
      case 'PlayStation 3':
        return Container(
            width: 50,
            height: 25,
            padding: EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20)),
            child: SvgPicture.asset('assets/badges/Playstation 3.svg',
                width: 14, height: 15));
      case 'PlayStation':
        return Container(
          width: 55,
          height: 25,
          decoration: BoxDecoration(
            color: Colors.grey.shade400,
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Container(
                width: 20, // Adjust the width as needed
                height: 20, // Adjust the height as needed
                margin: EdgeInsets.only(left: 6),
                child: SvgPicture.asset(
                  'assets/badges/PlayStation.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                  width: 5), // Adjust the spacing between icon and text
              const Text(
                'PS1',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 12, // Adjust the font size as needed
                ),
              ),
            ],
          ),
        );

      case 'PlayStation Vita':
        return Container(
            width: 65,
            height: 25,
            padding: EdgeInsets.only(left: 6, right: 4),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20)),
            child: SvgPicture.asset(
              'assets/badges/Playstation Vita-C.svg',
            ));
      case 'Nintendo 64':
        return Container(
            width: 50,
            height: 25,
            padding: EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(20)),
            child: SvgPicture.asset('assets/badges/Nintendo 64.svg',
                width: 14, height: 15));
      case 'Wii':
        return Container(
            width: 50,
            height: 25,
            padding: EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20)),
            child: SvgPicture.asset('assets/badges/Nintendo Wii.svg',
                width: 14, height: 15));
      case 'Wii U':
        return Container(
            width: 50,
            height: 25,
            padding: EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(20)),
            child: SvgPicture.asset('assets/badges/Nintendo Wii U.svg',
                width: 14, height: 15));
      case 'Xbox 360':
        return Container(
            width: 75,
            height: 25,
            padding: EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 226, 228, 229),
                border: Border.all(color: Colors.red.shade200),
                borderRadius: BorderRadius.circular(20)),
            child: SvgPicture.asset('assets/badges/Xbox 360.svg',
                width: 14, height: 15));
      case 'Xbox One':
        return Container(
            width: 75,
            height: 25,
            padding: EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
                color: Color.fromARGB(154, 6, 106, 16),
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20)),
            child: SvgPicture.asset('assets/badges/Xbox One.svg',
                width: 14, height: 15));
      case 'Xbox Series X/S':
        return Container(
            width: 75,
            height: 25,
            padding: EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 15, 122, 16),
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20)),
            child: SvgPicture.asset(
                'assets/badges/Xbox_Series_X_S-optimized.svg',
                width: 14,
                height: 15));
      case 'PC':
        return Container(
          width: 55,
          height: 25,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Container(
                width: 20, // Adjust the width as needed
                height: 20, // Adjust the height as needed
                margin: EdgeInsets.only(left: 6),
                child: SvgPicture.asset(
                  'assets/badges/PC.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                  width: 5), // Adjust the spacing between icon and text
              const Text(
                'PC',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 12, // Adjust the font size as needed
                ),
              ),
            ],
          ),
        );
      case 'Nintendo 3DS':
        return Container(
            width: 85,
            height: 25,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.white60,
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(20)),
            child: SvgPicture.asset('assets/badges/Nintendo 3DS.svg',
                width: 14, height: 150, fit: BoxFit.contain));
      case 'Nintendo DS':
        return Container(
            width: 85,
            height: 25,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.grey.shade400,
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(20)),
            child: SvgPicture.asset('assets/badges/Nintendo DS.svg',
                width: 14, height: 150, fit: BoxFit.contain));
      case 'Xbox':
        return Container(
          width: 100,
          height: 100,
          color: Colors.green, // Example color for Xbox
          child: Center(child: Text('Xbox')),
        );
      case 'Mobile':
        return Container(
          width: 65,
          height: 25,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Container(
                width: 20, // Adjust the width as needed
                height: 20, // Adjust the height as needed
                child: SvgPicture.asset(
                  'assets/badges/Mobile.svg',
                  fit: BoxFit.contain,
                ),
              ),
              const Flexible(
                child: Text(
                  'Mobile',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 12, // Adjust the font size as needed
                  ),
                ),
              )
            ],
          ),
        );

      default:
        return SizedBox(
          width: 50,
          height: 50,
          child: Text(platform),
        );
    }
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
                      if (widget.game.platforms.isNotEmpty)
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: widget.game.platforms
                              .map((platform) => buildBadge(platform))
                              .toList(),
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
