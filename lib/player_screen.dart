import 'package:flutter/material.dart';
import 'package:four_session/xo_game.dart';

class PlayerScreen extends StatelessWidget {
  static const String routName = 'player screen';

  String player1Name = "";

  String player2Name = "";

  PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          "Welcome To Route Games",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: const InputDecoration(label: Text("Player 1 Name")),
              onChanged: (text) {
                player1Name = text;
              },
            ),
            TextField(
              decoration: const InputDecoration(label: Text("Player 2 Name")),
              onChanged: (text) {
                player2Name = text;
              },
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    XoGame.routName,
                    arguments: XoGameBoardArgs(
                        player1Name: player1Name, player2Name: player2Name),
                  );
                },
                child: const Text(
                  "Go To Xo Game",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
