import 'package:flutter/material.dart';
import 'package:words_slide_puzzle/components/puzzle_box.dart';
import 'package:words_slide_puzzle/constants.dart';
import 'package:words_slide_puzzle/models/coordinates.dart';

class PuzzleBoard extends StatelessWidget {
  final List<List<String>> gameBoard;
  const PuzzleBoard({Key? key, required this.gameBoard}) : super(key: key);

  double calculateSize() {
    final double boxesSize = kPuzzleBoxSize * gameBoard.length;
    final double marginsSize= kPuzzleBoxMargin * gameBoard.length * 2;
    return boxesSize + marginsSize;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: calculateSize(),
      width: calculateSize(),
      decoration: BoxDecoration(color: kBoardGameColor),
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
