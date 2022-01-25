import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_slide_puzzle/components/puzzle_box.dart';
import 'package:words_slide_puzzle/providers/puzzle_brain_provider.dart';

class PuzzleBoard extends StatelessWidget {
  const PuzzleBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PuzzleBrainProvider>(
      builder: (context, provider, child) {
        return Column(
          children: generatePuzzleBoxes(provider.wordsAsListString),
        );
      },
    );
  }
}

List<Row> generatePuzzleBoxes(List<List<String>> words) {
  List<Row> _ = [];
  for (int y = 0; y< words.length; y++){
    List<PuzzleBox> puzzleBoxesRow = [];
    for (int x = 0; x< words[y].length; x++) {
      puzzleBoxesRow.add(PuzzleBox(x: x, y: y));
    }
    _.add(Row(children: puzzleBoxesRow));
  }
  return _;
}