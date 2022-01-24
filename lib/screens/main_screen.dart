import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:words_slide_puzzle/components/puzzle_box.dart';
import 'package:words_slide_puzzle/constants.dart';

class MainScreen extends StatelessWidget {
  static const String route = 'main_screen';

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                PuzzleBox(),
                PuzzleBox(),
                PuzzleBox(),
                PuzzleBox(),
                PuzzleBox(),
              ],
            ),
            Row(
              children: [
                PuzzleBox(),
                PuzzleBox(),
                PuzzleBox(),
                PuzzleBox(),
                PuzzleBox(),
              ],
            ),
            Row(
              children: [
                PuzzleBox(),
                PuzzleBox(),
                PuzzleBox(),
                PuzzleBox(),
                PuzzleBox(),
              ],
            ),
            Row(
              children: [
                PuzzleBox(),
                PuzzleBox(),
                PuzzleBox(),
                PuzzleBox(),
                PuzzleBox(),
              ],
            ),
            Row(
              children: [
                PuzzleBox(),
                PuzzleBox(),
                PuzzleBox(),
                PuzzleBox(),
                PuzzleBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
