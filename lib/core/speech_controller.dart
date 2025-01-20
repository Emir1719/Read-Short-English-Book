import 'dart:async';

import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechController {
  final FlutterTts _flutterTts = FlutterTts();
  final StreamController<int> _progressController = StreamController<int>.broadcast();
  bool _isSpeaking = false;
  bool _isPaused = false;
  int _currentWordIndex = 0;
  List<String> _words = [];

  TextToSpeechController() {
    _initialize();
  }

  Future<void> _initialize() async {
    await _flutterTts.setLanguage('en-US');
    await _flutterTts.setPitch(1);
    await _flutterTts.setVolume(1.0);
    await _flutterTts.setSpeechRate(0.5);

    _flutterTts.setProgressHandler((String text, int start, int end, String word) {
      _currentWordIndex = _words.indexWhere((w) => w == word);
      _progressController.add(_currentWordIndex); // İlerlemeyi yayınla
    });

    _flutterTts.setCompletionHandler(() {
      _isSpeaking = false;
      _currentWordIndex = 0;
      _progressController.add(_currentWordIndex); // Sıfırla
    });
  }

  Future<void> speak(String text) async {
    if (!_isSpeaking) {
      _words = text.split(RegExp(r'\s+'));
      _isSpeaking = true;
      _currentWordIndex = 0;
      await _flutterTts.speak(text);
    }
  }

  Future<void> pause() async {
    if (_isSpeaking && !_isPaused) {
      _isPaused = true;
      await _flutterTts.pause();
    }
  }

  Future<void> resume() async {
    if (_isSpeaking && _isPaused) {
      _isPaused = false;
      await _flutterTts.speak(_words.skip(_currentWordIndex).join(' '));
    }
  }

  Future<void> stop() async {
    if (_isSpeaking) {
      _isSpeaking = false;
      _isPaused = false;
      _currentWordIndex = 0;
      await _flutterTts.stop();
    }
  }

  Stream<int> get progressStream => _progressController.stream;

  bool get isSpeaking => _isSpeaking;
  bool get isPaused => _isPaused;
  int get currentWordIndex => _currentWordIndex;
  List<String> get words => _words;

  void dispose() {
    _progressController.close();
  }
}
