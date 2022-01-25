import 'dart:math';

const List<String> wordsDatabase = [
  'Query',
  'House',
  'Spell',
  'Plane',
  'Claim'
];

// TODO : Create a Class to manage repository
/// - Return words as String OK
/// - Return words shuffled
/// - Return words as List
/// - Return words as shuffled List
/// - Return N random words from database

class WordsRepository {
  final List<String> _words = wordsDatabase;

  String getRandomWord() {
    final int index = Random().nextInt(_words.length);
    return _words[index];
  }

  String shuffleString(String text) {
    final List<String> textAsList = text.split('');
    textAsList.shuffle();
    return textAsList.join('');
  }

  bool verifyIfExists(String word) {
    return _words.contains(word);
  }

  List<String> splitString(String text) => text.split('');
}
