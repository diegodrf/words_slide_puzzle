import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_slide_puzzle/constants.dart';
import 'package:words_slide_puzzle/models/coordinates.dart';
import 'package:words_slide_puzzle/providers/puzzle_brain_provider.dart';

class PuzzleBox extends StatelessWidget {
  final Coordinates coordinates;
  const PuzzleBox({Key? key, required this.coordinates})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PuzzleBrainProvider>(
      builder: (context, provider, child) {
        final String letter = provider.getLetter(coordinates).toUpperCase();

        return GestureDetector(
          onTap: () => provider.moveBox(coordinates),
          child: Container(
            margin: const EdgeInsets.all(kPuzzleBoxMargin),
            height: kPuzzleBoxSize,
            width: kPuzzleBoxSize,
            decoration: BoxDecoration(
                color: letter.isNotEmpty ? Colors.red : Colors.grey),
            child: Center(
              child: Text(
              letter
              ),
            ),
          ),
        );
      },
    );
  }
}
