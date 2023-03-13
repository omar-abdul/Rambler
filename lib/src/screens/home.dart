import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:english_words/english_words.dart';

import '../widgets/bramble_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    List<Map> story = [
      {
        'title':
            '${WordPair.random().first.toUpperCase()} ${WordPair.random().second.toUpperCase()}',
        'body': lorem()
      },
      {
        'title':
            '${WordPair.random().first.toUpperCase()} ${WordPair.random().second.toUpperCase()}',
        'body': lorem()
      },
      {
        'title':
            '${WordPair.random().first.toUpperCase()} ${WordPair.random().second.toUpperCase()}',
        'body': lorem()
      },
      {
        'title':
            '${WordPair.random().first.toUpperCase()} ${WordPair.random().second.toUpperCase()}',
        'body': lorem()
      },
      {
        'title':
            '${WordPair.random().first.toUpperCase()} ${WordPair.random().second.toUpperCase()}',
        'body': lorem()
      },
    ];

    return BrambleList(story: story);
  }
}
