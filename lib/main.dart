import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_slide_puzzle/providers/puzzle_brain_provider.dart';
import 'package:words_slide_puzzle/screens/main_screen.dart';

void main() {
  runApp(const WordsSlidePuzzleApp());
}

class WordsSlidePuzzleApp extends StatelessWidget {
  const WordsSlidePuzzleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PuzzleBrainProvider>(
      create: (context) => PuzzleBrainProvider(),
      child: MaterialApp(
        initialRoute: MainScreen.route,
        routes: {
          MainScreen.route: (context) => const MainScreen(),
        },
      ),
    );
  }
}
