import 'package:flutter/material.dart';
import 'package:tic_tac_toe/newgameui.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  _HomeUiState createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
          SizedBox(height: 20),
          Image.asset(
            "assets/image/ticTactoe.png",
            width: 300,
            height: 300,
            errorBuilder: (context, error, stackTrace) {
              return Text(
                "Image not found!",
                style: TextStyle(color: Colors.red),
              );
            },
          ),
          SizedBox(height: 20),
          StartScreenButton(
            ButtonText: "New Game",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewGame()),
              );
            },
          ),
          StartScreenButton(
            ButtonText: "Multiplayer",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MultiplayerUi()),
              );
            },
          ),
          StartScreenButton(
            ButtonText: "Settings",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsUi()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class StartScreenButton extends StatelessWidget {
  final String ButtonText;
  final VoidCallback onPressed;

  const StartScreenButton({
    super.key,
    required this.ButtonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.black),
          foregroundColor: MaterialStatePropertyAll(Colors.white),
          minimumSize: MaterialStatePropertyAll(Size(250, 50)),
          shape: MaterialStatePropertyAll(
            BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
        child: Text(ButtonText),
      ),
    );
  }
}

class NewGameUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Game")),
      body: Center(child: Text("New Game Screen")),
    );
  }
}

class MultiplayerUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Multiplayer")),
      body: Center(child: Text("Multiplayer Screen")),
    );
  }
}

class SettingsUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Center(child: Text("Settings Screen")),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeUi(),
    theme: ThemeData(
      textTheme: TextTheme(
        headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      ),
    ),
  ));
}
