import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tictac_toe/models/game_button.dart';

import 'models/custom_dialog.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GameButton>? buttonList;
  var playerOne;
  var playerTwo;
  var activePlayer;

  @override
  void initState() {
    super.initState();
    buttonList = doInitialization();
  }

  List<GameButton> doInitialization() {
    playerOne = [];
    playerTwo = [];
    activePlayer = 1;

    var gameButtons = <GameButton>[
      GameButton(id: 1),
      GameButton(id: 2),
      GameButton(id: 3),
      GameButton(id: 4),
      GameButton(id: 5),
      GameButton(id: 6),
      GameButton(id: 7),
      GameButton(id: 8),
      GameButton(id: 9),
    ];
    return gameButtons;
  }

  void playGame(GameButton gameButton) {
    setState(() {
      if (activePlayer == 1) {
        gameButton.text = "X";
        gameButton.backgroundColor = Colors.red;
        activePlayer = 2;
        playerOne.add(gameButton.id);
      } else {
        gameButton.text = "O";
        gameButton.backgroundColor = Colors.black;
        activePlayer = 1;
        playerTwo.add(gameButton.id);
      }
      gameButton.enabledButton = false;
      int winner = checkWinner();
      if (winner == -1) {
        if (buttonList!.every((p) => p.text != "")) {
          showDialog(
            context: context,
            builder: (_) => CustomDialog(
              title: "It's a Tie!",
              content: "Press the Reset button to start again",
              callback: resetGame,
            ),
          );
        } else {
          activePlayer == 2 ? autoPlay() : null;
        }
      }
    });
  }

  void autoPlay() {
    var emptyCells = [];
    var numberList = List.generate(9, (i) => i + 1);
    for (var cellID in numberList) {
      if (!(playerOne.contains(cellID) || playerTwo.contains(cellID))) {
        emptyCells.add(cellID);
      }
    }

    var randomPlay = Random();
    var randIndex = randomPlay.nextInt(emptyCells.length-1);
    var cellID = emptyCells[randIndex];
    int i = buttonList!.indexWhere((e) => e.id == cellID);
    playGame(buttonList![i]);
  }

  int checkWinner() {
    var winner = -1;
    if (playerOne.contains(1) &&
        playerOne.contains(2) &&
        playerOne.contains(3)) {
      winner = 1;
    }
    if (playerTwo.contains(1) &&
        playerTwo.contains(2) &&
        playerTwo.contains(3)) {
      winner = 2;
    }

    if (playerOne.contains(4) &&
        playerOne.contains(5) &&
        playerOne.contains(6)) {
      winner = 1;
    }
    if (playerTwo.contains(4) &&
        playerTwo.contains(5) &&
        playerTwo.contains(6)) {
      winner = 2;
    }

    if (playerOne.contains(7) &&
        playerOne.contains(8) &&
        playerOne.contains(9)) {
      winner = 1;
    }
    if (playerTwo.contains(7) &&
        playerTwo.contains(8) &&
        playerTwo.contains(9)) {
      winner = 2;
    }

    if (playerOne.contains(1) &&
        playerOne.contains(4) &&
        playerOne.contains(7)) {
      winner = 1;
    }
    if (playerTwo.contains(1) &&
        playerTwo.contains(4) &&
        playerTwo.contains(7)) {
      winner = 2;
    }

    if (playerOne.contains(2) &&
        playerOne.contains(5) &&
        playerOne.contains(8)) {
      winner = 1;
    }
    if (playerTwo.contains(2) &&
        playerTwo.contains(5) &&
        playerTwo.contains(8)) {
      winner = 2;
    }

    if (playerOne.contains(3) &&
        playerOne.contains(6) &&
        playerOne.contains(9)) {
      winner = 1;
    }
    if (playerTwo.contains(3) &&
        playerTwo.contains(6) &&
        playerTwo.contains(9)) {
      winner = 2;
    }

    if (playerOne.contains(1) &&
        playerOne.contains(5) &&
        playerOne.contains(9)) {
      winner = 1;
    }
    if (playerTwo.contains(1) &&
        playerTwo.contains(5) &&
        playerTwo.contains(9)) {
      winner = 2;
    }

    if (playerOne.contains(3) &&
        playerOne.contains(5) &&
        playerOne.contains(7)) {
      winner = 1;
    }
    if (playerTwo.contains(3) &&
        playerTwo.contains(5) &&
        playerTwo.contains(7)) {
      winner = 2;
    }

    if (winner != -1) {
      if (winner == 1) {
        showDialog(
          context: context,
          builder: (_) => CustomDialog(
            title: "Player 1 won!",
            content: "Press the Reset button to start again",
            callback: resetGame,
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (_) => CustomDialog(
            title: "Player 2 won!",
            content: "Press the Reset button to start again",
            callback: resetGame,
          ),
        );
      }
    }
    return winner;
  }

  void resetGame() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      buttonList = doInitialization();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Tic Tac Toe"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              itemBuilder: (_, index) => SizedBox(
                width: 100,
                height: 100,
                child: RaisedButton(
                  padding: EdgeInsets.all(8.0),
                  onPressed: buttonList![index].enabledButton
                      ? () => playGame(buttonList![index])
                      : null,
                  child: Text(
                    buttonList![index].text,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  color: buttonList![index].backgroundColor,
                  disabledColor: buttonList![index].backgroundColor,
                ),
              ),
              itemCount: buttonList!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 9.0,
                mainAxisSpacing: 9.0,
              ),
            ),
          ),
          RaisedButton(
            padding: EdgeInsets.all(20),
            color: Colors.red,
            onPressed: resetGame,
            child: Text(
              "Reset",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
