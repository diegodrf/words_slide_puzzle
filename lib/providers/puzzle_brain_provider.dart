import 'dart:async';
import 'dart:collection';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:words_slide_puzzle/models/coordinates.dart';
import 'package:words_slide_puzzle/models/enum/audios_enum.dart';
import 'package:words_slide_puzzle/models/enum/movements_enum.dart';
import 'package:words_slide_puzzle/services/repository/local.dart';

class PuzzleBrainProvider extends ChangeNotifier {
  final WordsRepository _wordsRepository = WordsRepository();
  final int numberOfWords = 5;
  List<List<String>> _gameBoard = [];
  List<bool> _correctRows = [];
  Coordinates _emptyBlockCoordinate = const Coordinates(x: 0, y: 0);
  int _movements = 0;
  DateTime _elapsedTime = DateTime(2022);
  Timer? _timer;
  bool _audio = true;

  bool get audio => _audio;

  DateTime get elapsedTime => _elapsedTime;

  List<List<String>> get gameBoard => UnmodifiableListView(_gameBoard);

  int get movements => _movements;

  void changeAudioStatus() {
    _audio = !_audio;
    notifyListeners();
  }

  verifyIfAnyWordIsCorrect() async {
    bool playAudio = false;
    for (int index = 0; index < _correctRows.length; index++) {
      if (_wordsRepository.verifyIfExists(_gameBoard[index].join(''))) {
        if (_correctRows[index] != true) {
          _correctRows[index] = true;
          if (_audio && playAudio == false) {
            playAudio = true;
          }
        }
      } else {
        _correctRows[index] = false;
      }
    }
    if(playAudio) {
      // A protection to play audio success only one time
      AudioPlayer _audioPlayer = AudioPlayer();
      _audioPlayer.play(AudiosEnum.success);
    }
  }

  bool isThisBoxInsideACorrectWord(Coordinates coordinates) {
    return _correctRows[coordinates.y];
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _elapsedTime = _elapsedTime.add(const Duration(seconds: 1));
      notifyListeners();
    });
  }

  void stopTimer() {
    _timer?.cancel();
    _elapsedTime = DateTime(2022);
  }

  void _createCorrectRowsList(int numberOfRows) {
    _correctRows = List<bool>.generate(numberOfRows, (index) => false);
  }

  Future<void> _createBoard(int numberOfWords) async {
    final List<List<String>> words = [];
    for (int i = 0; i < numberOfWords; i++) {
      // It's the original logic
      final String word = _wordsRepository.getRandomWord();
      final wordShuffled = _wordsRepository.shuffleString(word);
      final wordShuffledASList = _wordsRepository.splitString(wordShuffled);
      words.add(wordShuffledASList);

      // It's the debug logic
      // final String word = _wordsRepository.getRandomWord();
      // final wordShuffledASList = _wordsRepository.splitString(word);
      // words.add(wordShuffledASList);
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

  Future<bool> resetGame() async {
    stopTimer();
    await _createBoard(numberOfWords);
    _createCorrectRowsList(numberOfWords);
    _movements = 0;
    return true;
  }

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
    String letter = _gameBoard[from.y][from.x];
    String emptyBox = _gameBoard[to.y][to.x];

    _gameBoard[to.y][to.x] = letter;
    _gameBoard[from.y][from.x] = emptyBox;
    _emptyBlockCoordinate = findEmptyBox();
    _movements++;
    if (_movements == 1) {
      startTimer();
    }
    verifyIfAnyWordIsCorrect();
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
    if (_audio) {
      AudioPlayer _audioPlayer = AudioPlayer();
      _audioPlayer.play(AudiosEnum.tap);
    }
    notifyListeners();
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
