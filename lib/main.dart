import 'package:flutter/material.dart';
import 'package:manga_base/game.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar (
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text('birdle'),
          ),
        ),
        body: Center(
          child: GamePage(),
        ),
      ),
    );
  }
}

class Tile extends StatelessWidget {
  const Tile (this.letter, this.hitType, {super.key});

  final String letter;
  final HitType hitType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        color: switch (hitType) {
          HitType.hit => Colors.green,
          HitType.partial => Colors.yellow,
          HitType.miss => Colors.grey,
          _ => Colors.white,
        },
      ),
      child: Center(
        child: Text(
          letter.toUpperCase(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  } 
}

class GamePage extends StatelessWidget {
  GamePage({super.key});
  // This object is part of the game.dart file.
  // It manages wordle logic, and is outside the scope of this tutorial.
  final Game _game = Game();

  @override
  Widget build(BuildContext context) {
    // TODO: Replace with screen contents
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 5.0,
        children: [
          for (var guess in _game.guesses)
            Row(
              spacing: 5.0,
              children: [
                for (var letter in guess)
                  Tile(letter.char, letter.type)
              ],
            ),
          GuessInput(
            onSubmitGuess: (String guess) {
              print(guess);
            }
          )
          // ..._game.guesses.map((element) => Row(spacing: 5.0, children: [...element.map((e) => Tile(e.char, e.type),)]))
        ],
      ),
    );
  }
}

class GuessInput extends StatelessWidget {
  GuessInput({super.key, required this.onSubmitGuess});

  final void Function(String) onSubmitGuess;

  final TextEditingController _textEditingController = TextEditingController();
  
  final FocusNode _focusNode = FocusNode();

  void _onSubmit() {
    onSubmitGuess(_textEditingController.text.trim());
    _textEditingController.clear();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    // You'll build the UI in the next steps.


    return Row(
      children: [
        Expanded(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            maxLength: 5,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(35))
              )
            ),
            controller: _textEditingController,
            autofocus: true,
            focusNode: _focusNode,
            onSubmitted: (String guess) => _onSubmit(),
          ),
        )),
        IconButton(
          onPressed: _onSubmit,
          padding: EdgeInsets.zero,
          icon: Icon(Icons.arrow_circle_up),
        )
      ],
    );
  }
}
