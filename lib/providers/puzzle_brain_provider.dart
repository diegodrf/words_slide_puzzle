import 'dart:collection';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:words_slide_puzzle/models/coordinates.dart';
import 'package:words_slide_puzzle/models/enum/movements_enum.dart';
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

  Coordinates findEmptyBox() {
    Coordinates? coordinates;
    for (int y = 0; y < _gameBoard.length; y++) {
      for (int x = 0; x < _gameBoard[y].length; x++) {
        if (_gameBoard[y][x].isEmpty) {
          coordinates = Coordinates(x: x, y: y);
        }
      }
    }
    return coordinates!;
  }

  void changePositions(Coordinates from, Coordinates to) {
    String zero = _gameBoard[from.y][from.x];
    String nextElement = _gameBoard[to.y][to.x];

    _gameBoard[to.y][to.x] = zero;
    _gameBoard[from.y][from.x] = nextElement;
    _emptyBlockCoordinate = findEmptyBox();
  }

  void moveUp(Coordinates currentPosition) {
    changePositions(currentPosition,
        Coordinates(x: currentPosition.x, y: currentPosition.y - 1));
    if (kDebugMode) {
      print('Moving UP');
    }
  }

  void moveDown(Coordinates currentPosition) {
    changePositions(currentPosition,
        Coordinates(x: currentPosition.x, y: currentPosition.y + 1));
    if (kDebugMode) {
      print('Moving DOWN');
    }
  }

  void moveLeft(Coordinates currentPosition) {
    changePositions(currentPosition,
        Coordinates(x: currentPosition.x - 1, y: currentPosition.y));
    if (kDebugMode) {
      print('Moving LEFT');
    }
  }

  void moveRight(Coordinates currentPosition) {
    changePositions(currentPosition,
        Coordinates(x: currentPosition.x + 1, y: currentPosition.y));
    if (kDebugMode) {
      print('Moving RIGHT');
    }
  }

  void moveBox(Coordinates currentPosition) {
    /// Verify if current block is near of empty block
    MovementsEnum? direction = verifyWhereCanMove(currentPosition);
    switch (direction) {
      case MovementsEnum.up:
        moveUp(currentPosition);
        break;
      case MovementsEnum.down:
        moveDown(currentPosition);
        break;
      case MovementsEnum.left:
        moveLeft(currentPosition);
        break;
      case MovementsEnum.right:
        moveRight(currentPosition);
        break;
      default:
        null;
    }
    notifyListeners();

    if (kDebugMode) {
      print('');
      for (List<String> row in _gameBoard) {
        print(row);
      }
      print('');
    }
  }

  MovementsEnum? verifyWhereCanMove(Coordinates coordinates) {
    if (coordinates.x + 1 == _emptyBlockCoordinate.x &&
        coordinates.y == _emptyBlockCoordinate.y) {
      return MovementsEnum.right;
    } else if (coordinates.x - 1 == _emptyBlockCoordinate.x &&
        coordinates.y == _emptyBlockCoordinate.y) {
      return MovementsEnum.left;
    } else if (coordinates.y + 1 == _emptyBlockCoordinate.y &&
        coordinates.x == _emptyBlockCoordinate.x) {
      return MovementsEnum.down;
    } else if (coordinates.y - 1 == _emptyBlockCoordinate.y &&
        coordinates.x == _emptyBlockCoordinate.x) {
      return MovementsEnum.up;
    } else {
      return null;
    }
  }
}
