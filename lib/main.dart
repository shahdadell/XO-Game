import 'package:flutter/material.dart';
import 'package:four_session/player_screen.dart';
import 'package:four_session/xo_game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: PlayerScreen.routName,
      routes: {
        XoGame.routName: (context) => const XoGame(),
        PlayerScreen.routName: (context) => PlayerScreen(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
