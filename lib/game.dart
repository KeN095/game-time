class Game {
  final String name;
  final String alias;
  final double allStyles;
  final double completionistTime;
  final double extraTime;
  final double mainTime;
  //various times for different styles of playthroughs (these values can sometimes hold 0.0 if no data is available)
  final String reviewScore;
  final String releaseYear;
  final String developer;
  final String imageURL;
  final String gameID;
  final String gameType;
  final List<String> platforms;
  final String webLink;

  Game({
    required this.name,
    required this.alias,
    required this.allStyles,
    required this.completionistTime,
    required this.extraTime,
    required this.mainTime,
    required this.reviewScore,
    required this.releaseYear,
    required this.developer,
    required this.imageURL,
    required this.gameID,
    required this.gameType,
    required this.platforms,
    required this.webLink,
  });

  factory Game.jsonToObj(Map<String, dynamic> results) {
    List<String> platformList = [];
    if (results['game_platforms'] != null) {
      platformList = List<String>.from(results['game_platforms']);
    }

    results['game_review_score'] = results['game_review_score'].toString();
    results['game_release'] = results['game_release'].toString();
    results['game_id'] = results['game_id'].toString();

    if (results['alias'] == null) {
      results['alias'] = '';
    }

    if ((results['game_extra'] as num) > 0.0) {
      results['game_extra'] = (results['game_extra'] as num);
    }

    if ((results['game_completionist'] as num) > 0.0) {
      results['game_completionist'] = (results['game_completionist'] as num);
    }

    if ((results['game_main'] as num) > 0.0) {
      results['game_main'] = (results['game_main'] as num);
    }

    return Game(
        name: results['game_name'],
        alias: results['alias'],
        allStyles: results['game_all_styles'],
        completionistTime: results['game_completionist'],
        extraTime: results['game_extra'],
        mainTime: results['game_main'],
        reviewScore: results['game_review_score'],
        releaseYear: results['game_release'],
        developer: results['game_developer'],
        imageURL: results['game_image_url'],
        gameID: results['game_id'],
        gameType: results['game_type'],
        platforms: platformList,
        webLink: results['game_web_link']);
  }
}
