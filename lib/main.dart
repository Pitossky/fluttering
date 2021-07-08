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
        ),
      ),
    );
  }
}

