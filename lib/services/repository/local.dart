import 'dart:math';

const List<String> wordsDatabase = [
  'Query',
  'House',
  'Spell',
  'Plane',
  'Claim',
  'Black',
  'Brown',
  'Three',
  'Chess'
];

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
    print(word);
    return _words.contains(word);
  }

  List<String> splitString(String text) => text.split('');
}
