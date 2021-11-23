import 'package:flutter/material.dart';
import 'model/dependency_injection.dart';
import 'view/home_page.dart';

void main() async {
  Injector.configure(DataRepo.PRODUCTION);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crypto Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}


