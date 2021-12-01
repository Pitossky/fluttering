import 'package:another_app/model/app_details.dart';
import 'package:another_app/widgets/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var url =
      "https://api.tvmaze.com/singlesearch/shows?q=game%20of%20thrones&embed=episodes";

  AppDetails? appDetails;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  fetchData() async {
    var response = await http.get(Uri.parse(url));
    var decodedResponse = json.decode(response.body);
    appDetails = AppDetails.fromJson(decodedResponse);
    print(decodedResponse);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GOT"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: appDetails == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : AppWidget(
        imageUrl: appDetails!.image!.medium,
        getName: appDetails!.name,
        getRunTime: appDetails!.runtime.toString(),
        getSummary: appDetails!.summary,
        episodeImageUrl: appDetails!.image,
        movieEpisodeList: appDetails!.eEmbedded!.episodes,
      ),
    );
  }
}
