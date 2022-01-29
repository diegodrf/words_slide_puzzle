import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_slide_puzzle/components/game_status_component.dart';
import 'package:words_slide_puzzle/components/puzzle_board.dart';
import 'package:words_slide_puzzle/constants.dart';
import 'package:words_slide_puzzle/providers/puzzle_brain_provider.dart';


class MainScreen extends StatelessWidget {
  static const String route = 'main_screen';
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kGameBackgroundColor,
        body: Consumer<PuzzleBrainProvider>(
          builder: (context, provider, child) {
            return Center(
              child: Container(
                padding: const EdgeInsets.only(top: 30.0),
                height: double.infinity,
                width: 500.0,
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const GameStatusComponent(),
                    PuzzleBoard(gameBoard: provider.gameBoard),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

