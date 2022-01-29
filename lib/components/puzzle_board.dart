import 'package:flutter/material.dart';
import 'package:words_slide_puzzle/components/puzzle_box.dart';
import 'package:words_slide_puzzle/models/coordinates.dart';

class PuzzleBoard extends StatelessWidget {
  final List<List<String>> gameBoard;


  const PuzzleBoard({Key? key, required this.gameBoard}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450.0,
      width: 450.0,
      decoration: const BoxDecoration(color: Colors.blueAccent),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: generatePuzzleBoxes(gameBoard),
      ),
    );
  }
}

List<Row> generatePuzzleBoxes(List<List<String>> words) {
  // TODO: Refactor this code
  /// It's hard to read
  /// It isn't be here
  /// The functionality is right
  List<Row> _ = [];
  for (int y = 0; y < words.length; y++) {
    List<PuzzleBox> puzzleBoxesRow = [];
    for (int x = 0; x < words[y].length; x++) {
      Coordinates coordinates = Coordinates(x: x, y: y);
      puzzleBoxesRow.add(
        PuzzleBox(coordinates: coordinates),
      );
    }
    _.add(Row(children: puzzleBoxesRow));
  }
  return _;
}
