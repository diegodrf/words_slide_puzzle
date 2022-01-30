import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:words_slide_puzzle/providers/puzzle_brain_provider.dart';

class MenuComponent extends StatelessWidget {

  const MenuComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PuzzleBrainProvider>(
      builder: (context, provider, child) {
        return Container(
          margin: const EdgeInsets.only(bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  provider.changeAudioStatus();
                },
                child: Icon(
                  provider.audio ? FontAwesomeIcons.volumeUp : FontAwesomeIcons.volumeMute,
                  size: 15.0,
                  color: const Color(0xFF1E5128),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
