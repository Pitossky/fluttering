import 'package:another_app/model/app_details.dart';
import 'package:another_app/screens/episode_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  String imageUrl;
  String getName;
  String getRunTime;
  String getSummary;
  MyImage? episodeImageUrl;
  List<Episodes> movieEpisodeList;

  AppWidget({
    required this.imageUrl,
    required this.getName,
    required this.getRunTime,
    required this.getSummary,
    required this.episodeImageUrl,
    required this.movieEpisodeList,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Hero(
              tag: "g1",
              child: CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
            Text(
              getName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            Text(
              "Runtime: ${getRunTime} minutes",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              getSummary,
              style: TextStyle(
                  fontSize: 15.0, wordSpacing: 2, color: Colors.purple),
              textAlign: TextAlign.center,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EpisodePage(
                      movieEpisodes: movieEpisodeList,
                      episodeImage: episodeImageUrl.toString(),
                      episodeList: movieEpisodeList.length,
                      mediumImage: episodeImageUrl!.medium.toString(),
                    ),
                  ),
                );
              },
              color: Colors.purple,
              child: Text(
                "Check Episodes",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
