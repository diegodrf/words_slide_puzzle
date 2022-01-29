import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_slide_puzzle/components/puzzle_board.dart';
import 'package:words_slide_puzzle/constants.dart';
import 'package:words_slide_puzzle/providers/puzzle_brain_provider.dart';
import 'package:intl/intl.dart';

class MainScreen extends StatefulWidget {
  static const String route = 'main_screen';

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
                    // block 1
                    // block 2
                    Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          KeyValueInfoComponent(
                            keyWidget: const Icon(
                              Icons.timer,
                              color: kInfoValueColor,
                            ),
                            value: DateFormat.ms().format(provider.elapsedTime),
                          ),
                          TextButton(
                            onPressed: () => provider.resetGame(),
                            child: const Text('START'),
                          ),
                          KeyValueInfoComponent(
                            keyWidget: const Text(
                              'MOVES',
                              style: kInfoStyle,
                            ),
                            value: provider.movements.toString(),
                          ),
                        ],
                      ),
                    ),
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

class KeyValueInfoComponent extends StatelessWidget {
  final Widget keyWidget;
  final String value;

  const KeyValueInfoComponent({
    Key? key,
    required this.keyWidget,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: 100.0,
      decoration: BoxDecoration(
          color: const Color(0xFF892C03),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          keyWidget,
          const VerticalDivider(
            width: 10.0,
            indent: 8.0,
            endIndent: 8.0,
            color: Color(0xFF391000),
          ),
          Text(
            value,
            style: kInfoStyle,
          ),
        ],
      ),
    );
  }
}
