import 'package:flutter/foundation.dart';
import 'package:words_slide_puzzle/services/repository/local.dart';
import 'dart:math';

class PuzzleBrainProvider extends ChangeNotifier {
  List<List<String>> _wordsAsListString = [];
  List<List<String>> get wordsAsListString => _wordsAsListString;


  PuzzleBrainProvider() {
    resetWords();
  }

  void resetWords() {
    final List<List<String>> newList = [];
    for (String word in wordsDatabase) {
      newList.add(word.split(''));
    }
    for (List<String> word in newList) {
      word.shuffle();
    }
    newList.shuffle();

    // Remove a random element
    final int y = Random().nextInt(newList.length);
    final int x = Random().nextInt(newList[y].length);
    newList[y][x] = '';

    _wordsAsListString = newList;
  }
}