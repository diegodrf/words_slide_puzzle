import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_slide_puzzle/constants.dart';
import 'package:words_slide_puzzle/models/coordinates.dart';
import 'package:words_slide_puzzle/providers/puzzle_brain_provider.dart';

class PuzzleBox extends StatelessWidget {
  final Coordinates coordinates;

  const PuzzleBox({Key? key, required this.coordinates}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PuzzleBrainProvider>(
      builder: (context, provider, child) {
        final String letter = provider.getLetter(coordinates).toUpperCase();

        Color setColor() {
          if (letter.isEmpty) {
            return Colors.transparent;
          } else if (provider.isThisBoxInsideACorrectWord(coordinates)) {
            return Colors.green;
          } else {
            return Colors.red;
          }
        }

        return GestureDetector(
          onTap: () => provider.moveBox(coordinates),
          child: Container(
            margin: const EdgeInsets.all(kPuzzleBoxMargin),
            height: kPuzzleBoxSize,
            width: kPuzzleBoxSize,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              boxShadow: [
                BoxShadow(
                  color:
                      letter.isNotEmpty ? Colors.black54 : Colors.transparent,
                  offset: const Offset(3.0, 3.0),
                )
              ],
              color: setColor(),
            ),
            child: Center(
              child: Text(
                letter,
                style: kLetterBoxTextStyle,
              ),
            ),
          ),
        );
      },
    );
  }
}
