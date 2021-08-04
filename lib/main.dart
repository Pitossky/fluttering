import 'package:flutter/material.dart';
import 'package:to_do_list/screens/task_screen.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/models/task_data.dart';

void main() {
  runApp(ToDo());
}

class ToDo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TaskScreen(),
      ),
    );
  }
}
