import 'package:flutter_tts/flutter_tts.dart';

class AppTextToSpeech {
  final FlutterTts _flutterTts = FlutterTts();

  AppTextToSpeech() {
    init();
  }

  Future<void> init() async {
    await _flutterTts.setLanguage('en-US');
    await _flutterTts.setPitch(1);
    await _flutterTts.setVolume(1.0);
    await _flutterTts.setSpeechRate(0.5);

    // for ios
    await _flutterTts.setSharedInstance(true);
  }

  Future<void> speak(String text) async {
    await _flutterTts.speak(text);
  }

  Future<void> stop() async {
    await _flutterTts.stop();
  }

  Future<void> pause() async {
    await _flutterTts.pause();
  }
}
