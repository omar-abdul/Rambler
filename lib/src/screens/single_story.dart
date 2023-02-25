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
              ),
              Text(story['body'])
            ],
          ),
        ));
  }
}
