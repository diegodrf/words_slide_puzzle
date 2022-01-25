import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_slide_puzzle/constants.dart';
import 'package:words_slide_puzzle/providers/puzzle_brain_provider.dart';

class PuzzleBox extends StatelessWidget {
  final int x;
  final int y;
  // TODO: Change this Widget to receive [Coordinate] instead x and y as int
  const PuzzleBox({Key? key, required this.x, required this.y})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PuzzleBrainProvider>(
      builder: (context, provider, child) {
        final String letter = provider.wordsAsListString[y][x].toUpperCase();

        return Container(
          margin: const EdgeInsets.all(kPuzzleBoxMargin),
          height: kPuzzleBoxSize,
          width: kPuzzleBoxSize,
          decoration: BoxDecoration(
              color: letter.isNotEmpty ? Colors.red : Colors.white),
          child: Center(
            child: Text(
            letter
            ),
          ),
        );
      },
    );
  }
}
