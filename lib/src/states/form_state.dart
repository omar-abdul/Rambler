import 'package:flutter/material.dart';

class WordsLengthState with ChangeNotifier {
  int wordLength = 50;
  int wordsLeft = 0;
  void changeLength(int newLength) {
    wordLength = newLength;
    notifyListeners();
  }

  void upDateWordCount(int inputText) {
    wordsLeft = inputText;

    notifyListeners();
  }
}
