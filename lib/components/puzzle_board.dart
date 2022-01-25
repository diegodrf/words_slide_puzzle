import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_slide_puzzle/components/puzzle_box.dart';
import 'package:words_slide_puzzle/models/coordinates.dart';
import 'package:words_slide_puzzle/providers/puzzle_brain_provider.dart';

class PuzzleBoard extends StatelessWidget {
  const PuzzleBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PuzzleBrainProvider>(
      builder: (context, provider, child) {
        return Column(
          children: generatePuzzleBoxes(provider.gameBoard),
        );
      },
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
