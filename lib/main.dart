import 'package:flutter/material.dart';
import 'package:tic_tac_toe/home.dart';
import 'package:tic_tac_toe/newgameui.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeUi(), // Replace `NewGame` with `HomeUi` if you want to start with the home screen.
    );
  }
}
