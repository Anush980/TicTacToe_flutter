import 'package:flutter/material.dart';

class NewGame extends StatefulWidget {
  const NewGame({super.key});

  @override
  _NewGameState createState() => _NewGameState();
}

class _NewGameState extends State<NewGame> {
  List<String> boardState = List.filled(9, ""); // Tic-Tac-Toe board state
  String currentPlayer = "X"; // Current player (X or O)

  /// Handles player tap on the board
  void handleTap(int index) {
    setState(() {
      if (boardState[index] == "") {
        boardState[index] = currentPlayer;

        if (checkWinner() != "") {
          showResultDialog(checkWinner());
        } else if (!boardState.contains("")) {
          showResultDialog("Draw");
        } else {
          currentPlayer = currentPlayer == "X" ? "O" : "X"; // Switch player
        }
      }
    });
  }

  /// Resets the game to the initial state
  void resetGame() {
    setState(() {
      boardState = List.filled(9, "");
      currentPlayer = "X";
    });
  }

  /// Checks for a winner
  String checkWinner() {
    const List<List<int>> winningPositions = [
      [0, 1, 2], // Row 1
      [3, 4, 5], // Row 2
      [6, 7, 8], // Row 3
      [0, 3, 6], // Column 1
      [1, 4, 7], // Column 2
      [2, 5, 8], // Column 3
      [0, 4, 8], // Diagonal
      [2, 4, 6], // Diagonal
    ];

    for (var positions in winningPositions) {
      if (boardState[positions[0]] != "" &&
          boardState[positions[0]] == boardState[positions[1]] &&
          boardState[positions[1]] == boardState[positions[2]]) {
        return boardState[positions[0]]; // Return the winner (X or O)
      }
    }
    return ""; // No winner
  }

  /// Shows the result dialog
  void showResultDialog(String result) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(result == "Draw" ? "It's a Draw!" : "Winner: $result"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                resetGame();
              },
              child: Text("Replay"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              playerBox(playerName: "Player X"),
              playerBox(playerName: "Player O"),
            ],
          ),
          SizedBox(height: 20),
          board(
            boardState: boardState,
            onTap: handleTap,
          ),
          SizedBox(height: 1),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: StartScreenButton(
              ButtonText: "Replay",
              onPressed: resetGame,
            ),
          ),
        ],
      ),
    );
  }
}

class board extends StatelessWidget {
  final List<String> boardState;
  final Function(int) onTap;

  const board({required this.boardState, required this.onTap, super.key});

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
        itemCount: boardState.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onTap(index),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
              ),
              child: Center(
                child: Text(
                  boardState[index],
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
  final String playerName;

  const playerBox({required this.playerName, super.key});

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
        child: Center(
          child: Text(
            playerName,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}

class StartScreenButton extends StatelessWidget {
  final String ButtonText;
  final VoidCallback? onPressed;

  const StartScreenButton({
    required this.ButtonText,
    this.onPressed,
    super.key,
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
