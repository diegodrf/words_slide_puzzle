import 'package:flutter/material.dart';
import 'package:words_slide_puzzle/components/puzzle_board.dart';

class MainScreen extends StatelessWidget {
  static const String route = 'main_screen';

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: const [PuzzleBoard()],
        ),
      ),
    );
  }
}
