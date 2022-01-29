import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_slide_puzzle/components/game_status_component.dart';
import 'package:words_slide_puzzle/components/puzzle_board.dart';
import 'package:words_slide_puzzle/providers/puzzle_brain_provider.dart';

class MainScreen extends StatelessWidget {
  static const String route = 'main_screen';

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<PuzzleBrainProvider>(
          builder: (context, provider, child) {
            return Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GameStatusComponent(),
                  Column(
                    children: [
                      TextButton(
                        onPressed: () => provider.resetGame(),
                        child: const Text('START'),
                      ),
                      PuzzleBoard(gameBoard: provider.gameBoard),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
