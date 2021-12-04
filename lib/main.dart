import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tutorial_three/answer_widget.dart';
import 'dart:convert';

import 'package:tutorial_three/quiz_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.blue[800],
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  QuizModel? quiz;
  List<Results>? quizResults;

  Future<void> fetchQuestions() async {
    var response = await http.get(
      Uri.parse("https://opentdb.com/api.php?amount=20"),
    );
    var decodedResponse = json.decode(response.body);
    quiz = QuizModel.fromJson(decodedResponse);
    quizResults = quiz!.results!;
    print(decodedResponse);
    //setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Take Quiz",
          style: TextStyle(
            color: Theme.of(context).accentColor,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
      ),
      body: RefreshIndicator(
        onRefresh: fetchQuestions,
        child: FutureBuilder(
          future: fetchQuestions(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Text("Press Button to start");
              case ConnectionState.active:
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                if (snapshot.hasError) return errorData(snapshot);
                return questionList();
            }
          },
        ),
      ),
    );
  }

  Padding errorData(AsyncSnapshot snapshot){
    return Padding(
        padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Error: ${snapshot.error}"),
          const SizedBox(
            height: 20,
          ),
          RaisedButton(
              onPressed: (){
                fetchQuestions();
                setState(() {});
              },
            child: const Text("Try Again"),
          ),
        ],
      ),
    );
  }

  ListView questionList() {
    return ListView.builder(
      itemCount: quizResults!.length,
      itemBuilder: (context, index) => Card(
        color: Theme.of(context).primaryColor,
        child: ExpansionTile(
          title: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  quizResults![index].question,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FilterChip(
                        label: Text(
                          quizResults![index].category,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        onSelected: (b) {},
                        backgroundColor: Colors.grey[700],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      FilterChip(
                        label: Text(
                          quizResults![index].difficulty,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
                        ),
                        onSelected: (b) {},
                        backgroundColor: Colors.grey[700],
                      ),
                    ],
                  ),
                ),
              ]),
          leading: CircleAvatar(
            backgroundColor: Colors.grey[500],
            child: Text(
              quizResults![index].type!.startsWith("m") ? "M" : "B",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          children: quizResults![index].allAnswers!.map((e){
            return AnswerWidget(
              resultList: quizResults,
              answers: e,
              index: index,
            );
          }).toList(),
        ),
      ),
    );
  }
}
