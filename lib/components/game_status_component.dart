import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_slide_puzzle/providers/puzzle_brain_provider.dart';

class GameStatusComponent extends StatelessWidget {
  const GameStatusComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PuzzleBrainProvider>(builder: (context, provider, child) {
      return Container(
        height: 450,
        width: 450,
        decoration: const BoxDecoration(color: Colors.grey),
        child: Column(
          children: [
            StatusRow(
              text: 'Movements',
              value: provider.movements,
            )
          ],
        ),
      );
    });
  }
}

class StatusRow extends StatelessWidget {
  final String text;
  final int value;

  const StatusRow({
    Key? key,
    required this.text,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [Text(text), Text(value.toString())],
    );
  }
}
