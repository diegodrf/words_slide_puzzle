import 'package:flutter/material.dart';
import 'package:words_slide_puzzle/constants.dart';

class PuzzleBox extends StatelessWidget {
  const PuzzleBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kPuzzleBoxMargin),
      height: kPuzzleBoxSize,
      width: kPuzzleBoxSize,
      decoration: BoxDecoration(color: Colors.red),
      child: Center(child: Text('A')),
    );
  }
}
