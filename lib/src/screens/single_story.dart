import 'package:bramble_project/src/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class SingleStory extends StatelessWidget {
  const SingleStory({required this.story, super.key});
  final Map story;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Story'),
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
