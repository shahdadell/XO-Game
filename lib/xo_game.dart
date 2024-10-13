import 'package:flutter/material.dart';

import 'board_button.dart';

class XoGame extends StatefulWidget {
  static const String routName = "Xo";

  const XoGame({super.key});

  @override
  State<XoGame> createState() => _XoGameState();
}

class _XoGameState extends State<XoGame> {
  List<String> boardState = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  int player1Score = 0;

  int player2Score = 0;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as XoGameBoardArgs;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          "Xo Game",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${args.player1Name}(X)",
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "$player1Score",
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${args.player2Name}(X)",
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "$player2Score",
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(
                  text: boardState[0],
                  index: 0,
                  onButtonClicked: onButtonCLick,
                ),
                BoardButton(
                  text: boardState[1],
                  index: 1,
                  onButtonClicked: onButtonCLick,
                ),
                BoardButton(
                  text: boardState[2],
                  index: 2,
                  onButtonClicked: onButtonCLick,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(
                  text: boardState[3],
                  index: 3,
                  onButtonClicked: onButtonCLick,
                ),
                BoardButton(
                  text: boardState[4],
                  index: 4,
                  onButtonClicked: onButtonCLick,
                ),
                BoardButton(
                  text: boardState[5],
                  index: 5,
                  onButtonClicked: onButtonCLick,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(
                  text: boardState[6],
                  index: 6,
                  onButtonClicked: onButtonCLick,
                ),
                BoardButton(
                  text: boardState[7],
                  index: 7,
                  onButtonClicked: onButtonCLick,
                ),
                BoardButton(
                  text: boardState[8],
                  index: 8,
                  onButtonClicked: onButtonCLick,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int counter = 0;

  void onButtonCLick(int index) {
    if (boardState[index].isNotEmpty) {
      return;
    }
    if (counter % 2 == 0) {
      boardState[index] = "x";
    } else {
      boardState[index] = "o";
    }
    counter++;
    if (checkWinner('x')) {
      player1Score += 1;
      initBoard();
    } else if (checkWinner('o')) {
      player2Score += 1;
      initBoard();
    } else if (counter == 9) {
      initBoard();
    }
    setState(() {});
  }

  bool checkWinner(String symbol) {
    for (int i = 0; i < 9; i += 3) {
      if (boardState[i] == symbol &&
          boardState[i + 1] == symbol &&
          boardState[i + 2] == symbol) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (boardState[i] == symbol &&
          boardState[i + 3] == symbol &&
          boardState[i + 6] == symbol) {
        return true;
      }
    }
    if (boardState[0] == symbol &&
        boardState[4] == symbol &&
        boardState[8] == symbol) {
      return true;
    }
    if (boardState[2] == symbol &&
        boardState[4] == symbol &&
        boardState[6] == symbol) {
      return true;
    } else {
      return false;
    }
  }

  void initBoard() {
    boardState = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ];
    counter = 0;
  }
}

//data class
class XoGameBoardArgs {
  String player1Name;

  String player2Name;

  XoGameBoardArgs({required this.player1Name, required this.player2Name});
}
