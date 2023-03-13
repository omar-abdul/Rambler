import 'package:bramble_project/src/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../screens/single_story.dart';

// TODO: replace static story with dynamic from db;

class BrambleList extends StatelessWidget {
  const BrambleList({
    super.key,
    required this.story,
  });

  final List<Map> story;
  final int likesNum = 5;
  final int commentsNum = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.orange),
              child:
                  Text('Drawer Header', style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: const CustomAppBar(title: 'Feed'),
      body: ListView.builder(
        itemCount: story.length,
        itemBuilder: (context, index) {
          return Center(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SingleStory(story: story[index])));
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        title: Text(story[index]['title']),
                      ),
                      Flexible(
                          child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              story[index]['body'],
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 4, 10, 4),
                                  child: Row(children: [
                                    Text.rich(
                                      TextSpan(
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '$likesNum',
                                          ),
                                          const WidgetSpan(
                                            child: Icon(
                                              Icons.favorite_outline,
                                              size: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 15,
                                      height: 5,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black45,
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '$commentsNum',
                                          ),
                                          const WidgetSpan(
                                            child: Icon(
                                              Icons.comment_outlined,
                                              size: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                                ),
                              ])
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
