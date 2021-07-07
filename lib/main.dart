import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal[500],
        appBar: AppBar(
          title: Text('Dice Rolling App'),
          backgroundColor: Colors.teal[800],
        ),
        body: Dice(),
      ),
    ),
  );
}
class Dice extends StatefulWidget {

  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void rollDice () {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: FlatButton(onPressed: () {
              rollDice();
            },
                child: Image.asset('images/dice$leftDiceNumber.png')),
          ),
          Expanded(
            child: FlatButton(onPressed: () {
              rollDice();
            },
                child: Image.asset('images/dice$rightDiceNumber.png')),
          ),
        ],
      ),
    );
  }
}


