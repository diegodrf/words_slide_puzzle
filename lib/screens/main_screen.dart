import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_slide_puzzle/components/puzzle_board.dart';
import 'package:words_slide_puzzle/models/enum/images.dart';
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
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage(ImagesEnum.woodBackground),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      // block 1
                      // block 2
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
