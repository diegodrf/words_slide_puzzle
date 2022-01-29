import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_slide_puzzle/components/game_status_component.dart';
import 'package:words_slide_puzzle/components/puzzle_board.dart';
import 'package:words_slide_puzzle/constants.dart';
import 'package:words_slide_puzzle/providers/puzzle_brain_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  static const String route = 'main_screen';

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    _animation = ColorTween(begin: Color(0xFFD8E9A8), end: Color(0xFF4E9F3D))
        .animate(_animationController);

    _animationController.repeat(reverse: true);
    _animation.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Icon(FontAwesomeIcons.frog, color: Color(0xFF4E9F3D),),
          backgroundColor: Color(0xFF1E5128),
          centerTitle: true,
        ),
        backgroundColor: _animation.value,
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
