import 'package:flutter/material.dart';
import 'package:tic_tac_toe/newgameui.dart';

class HomeUi extends StatefulWidget {
  HomeUi({Key? key}) : super(key: key);

  @override
  _HomeUiState createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Tic Tac Toe",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
          Image.asset("assets/image/ticTactoe.png", width: 300, height: 300),
          StartScreenButton(ButtonText: "New Game"),
          StartScreenButton(ButtonText: "Multiplayer"),
          StartScreenButton(ButtonText: "Settings"),
        ],
      ),
    );
  }
}

class StartScreenButton extends StatelessWidget {
  final String ButtonText;
  const StartScreenButton({super.key, required this.ButtonText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () => {},
        child: Text(ButtonText),
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.black),
          foregroundColor: WidgetStatePropertyAll(Colors.white),
          minimumSize: WidgetStatePropertyAll(Size(250, 50)),
          shape: WidgetStatePropertyAll(
            BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ),
    );
  }
}
