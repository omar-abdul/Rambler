import 'package:flutter/material.dart';

import 'custom_app_bar.dart';

class SingleStoryWidget extends StatelessWidget {
  const SingleStoryWidget({super.key, required this.story});
  final Map story;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: story['title'].toString().toUpperCase()),
        body: Center(
          child: Column(
            children: [
              ListTile(
                title: Text(story['title']),
                subtitle: const Text('author'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(story['body']),
              ),
              Flexible(
                  child: Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.favorite_outline),
                      label: const Text('Like'),
                    ),
                    TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.favorite_outline),
                      label: const Text('Leave a comment'),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ));
  }
}
