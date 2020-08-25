import 'package:flutter/material.dart';
import './manager.dart';

void main() => runApp(MyMainApp());

class MyMainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.deepOrange, accentColor: Colors.deepPurple),
      home: Scaffold(
          appBar: AppBar(
            title: Text("Food List"),
          ),
          body: ImageManager('Food Tester')),
    );
  }
}
