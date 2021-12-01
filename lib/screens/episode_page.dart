import 'package:another_app/model/app_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EpisodePage extends StatelessWidget {
  final List<Episodes> movieEpisodes;
  final String episodeImage;
  final int episodeList;
  final String mediumImage;

  const EpisodePage({
    required this.movieEpisodes,
    required this.episodeImage,
    required this.episodeList,
    required this.mediumImage,
  });

  Widget episodeWidget() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1.0),
      itemCount: episodeList,
      itemBuilder: (context, int index) => Card(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              movieEpisodes[index].image!.original,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    movieEpisodes[index].name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.red,
                child: Text(
                  "${movieEpisodes[index].season} - ${movieEpisodes[index].number}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Hero(
              tag: "g1",
              child: CircleAvatar(
                backgroundImage: NetworkImage(mediumImage),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            const Text("All Episodes"),
          ],
        ),
      ),
      body: episodeWidget(),
    );
  }
}
