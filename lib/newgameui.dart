import 'package:flutter/material.dart';
import 'package:tic_tac_toe/home.dart';

class NewGame extends StatefulWidget {
  NewGame({Key? key}) : super(key: key);

  @override
  _NewGameState createState() => _NewGameState();
}

class _NewGameState extends State<NewGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [playerBox(), playerBox()],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [board()]),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: StartScreenButton(ButtonText: "Replay"),
          ),
        ],
      ),
    );
  }
}

class board extends StatelessWidget {
  const board({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 364,
      width: 364,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (contexed, index) {
          return GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
              ),
              child: Center(
                child: Text(
                  "$index",
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class playerBox extends StatelessWidget {
  const playerBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Container(
        height: 130,
        width: 107,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
