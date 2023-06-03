import 'dart:async';

import 'package:flutter/material.dart';

class WordElevatedButton extends StatelessWidget {
  const WordElevatedButton(
      {super.key,
      required this.wordLength,
      required this.currLength,
      required this.changeLength});
  final int wordLength;
  final int currLength;
  final FutureOr<void> Function(int wordLength) changeLength;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          changeLength(wordLength);
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (states) =>
                    currLength == wordLength ? Colors.orange.shade400 : null),
            foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                (states) => currLength == wordLength
                    ? Theme.of(context).colorScheme.onPrimary
                    : null),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18)))),
        child: Text('$wordLength'));
  }
}
