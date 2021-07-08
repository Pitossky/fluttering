<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  
  void playASound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Expanded buildPlayer({
    required Color color,
    required String playerName,
    required int soundNumber
  })
  {return Expanded(
      child: FlatButton(
        color: color,
        child: Text(playerName),
        onPressed: () {
          playASound(soundNumber);
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            'Xylophone Musical Instrument',

          ),
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildPlayer(color: Colors.red, playerName: 'Player 1', soundNumber: 1),
                buildPlayer(color: Colors.orange, playerName: 'Player 2', soundNumber: 2),
                buildPlayer(color: Colors.yellow, playerName: 'Player 3', soundNumber: 3),
                buildPlayer(color: Colors.green, playerName: 'Player 4', soundNumber: 4),
                buildPlayer(color: Colors.blue, playerName: 'Player 5', soundNumber: 5),
                buildPlayer(color: Colors.indigo, playerName: 'Player 6', soundNumber: 6),
                buildPlayer(color: Colors.purple, playerName: 'Player 7', soundNumber: 7),
              ],
            ),
=======
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(BusinessCard());

class BusinessCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/PETER.jpg'),
              ),
              Text(
                'OLAYOOYE  PETER',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[100],
                  letterSpacing: 2.5,
                ),
              ),
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  color: Colors.teal[100],
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal[900],
                  ),
                  title: Text('+44 123 445566 77',
                    style: TextStyle(
                      color: Colors.teal[900],
                      fontFamily: 'Source Sans Pro',
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal[900],
                  ),
                  title: Text('olayooyepeter@gmail.com',
                    style: TextStyle(
                      color: Colors.teal[900],
                      fontFamily: 'Source Sans Pro',
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
>>>>>>> 1fd54d67170f7a994ffc6656a310c8ae166c6028
        ),
      ),
    );
  }
}

