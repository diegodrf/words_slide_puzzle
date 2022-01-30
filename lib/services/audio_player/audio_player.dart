import 'package:audioplayers/audioplayers.dart';

class AppAudioPlayer {
  static AppAudioPlayer? _instance;
  final AudioPlayer _audioPlayer = AudioPlayer();

  AppAudioPlayer._();

  static AppAudioPlayer getInstance() {
    _instance ??= AppAudioPlayer._();
    return _instance!;
  }

  Future play(String audioPath) async {
    _audioPlayer.play(audioPath, isLocal: true);
  }

}
