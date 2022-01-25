import 'dart:collection';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:words_slide_puzzle/models/coordinates.dart';
import 'package:words_slide_puzzle/services/repository/local.dart';

class PuzzleBrainProvider extends ChangeNotifier {
  final WordsRepository _wordsRepository = WordsRepository();
  List<List<String>> _gameBoard = [];
  Coordinates _emptyBlockCoordinate = const Coordinates(x: 0, y: 0);

  List<List<String>> get gameBoard => UnmodifiableListView(_gameBoard);

  void _createBoard() {
    final List<List<String>> words = [];
    const int numberOfWords = 5;
    for (int i = 0; i < numberOfWords; i++) {
      final String word = _wordsRepository.getRandomWord();
      final wordShuffled = _wordsRepository.shuffleString(word);
      final wordShuffledASList = _wordsRepository.splitString(wordShuffled);
      words.add(wordShuffledASList);
    }
    _gameBoard = words;
    _removeRandomElement();
    notifyListeners();
  }

  void _removeRandomElement() {
    int y = Random().nextInt(_gameBoard.length);
    int x = Random().nextInt(_gameBoard[0].length);
    _gameBoard[y][x] = '';
    _emptyBlockCoordinate = Coordinates(x: x, y: y);
  }

  void resetGame() => _createBoard();

  String getLetter(Coordinates coordinates) {
    final String letter = _gameBoard[coordinates.y][coordinates.x];
    return letter;
  }

  void changePositions(Coordinates from, Coordinates to) {
    String zero = _gameBoard[from.y][from.x];
    String nextElement = _gameBoard[to.y][to.x];

    _gameBoard[to.y][to.x] = zero;
    _gameBoard[from.y][from.x] = nextElement;
  }

  void moveUp() {
    if (_emptyBlockCoordinate.y > 0) {
      changePositions(
          _emptyBlockCoordinate,
          Coordinates(
              x: _emptyBlockCoordinate.x, y: _emptyBlockCoordinate.y + 1));
      print('Moving UP');
    }
  }

  void moveLeft() {
    if (_emptyBlockCoordinate.x > 0) {
      changePositions(
        Coordinates(x: _emptyBlockCoordinate.x - 1, y: _emptyBlockCoordinate.y),
        _emptyBlockCoordinate,
      );
      print('Moving LEFT');
    }
  }

  void moveRight() {
    final int _columns = _gameBoard[0].length;
    if (_emptyBlockCoordinate.x < _columns - 1) {
      changePositions(
          Coordinates(
              x: _emptyBlockCoordinate.x + 1, y: _emptyBlockCoordinate.y),
          _emptyBlockCoordinate);
      print('Moving RIGHT');
    }
  }

  void moveDown() {
    final int _rows = _gameBoard.length;
    if (_emptyBlockCoordinate.y < _rows - 1) {
      changePositions(
          _emptyBlockCoordinate,
          Coordinates(
              x: _emptyBlockCoordinate.x, y: _emptyBlockCoordinate.y - 1));
      print('Moving DOWN');
    }
  }

  void moveBox(Coordinates coordinates) {
    /// Verify if current block is near of empty block
    // TODO: Apply adjust to verify current position and apply correct movement
    if (coordinates.x - _emptyBlockCoordinate.x == 1) {
      moveLeft();
    } else if (coordinates.x - _emptyBlockCoordinate.x == -1) {
      moveRight();
    }
    notifyListeners();
  }
}
