import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:words_slide_puzzle/providers/puzzle_brain_provider.dart';

import '../constants.dart';
import 'key_value_info_component.dart';

class GameStatusComponent extends StatelessWidget {
  const GameStatusComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PuzzleBrainProvider>(
      builder: (context, provider, child) {
        return Container(
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
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(10),
                  backgroundColor: MaterialStateProperty.all(
                    kInfoBackgroundColor,
                  ),
                ),
                onPressed: () => provider.resetGame(),
                child: const Text(
                  'START',
                  style: kInfoStyle,
                ),
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
        );
      },
    );
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
