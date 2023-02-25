import 'package:bramble_project/src/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import './single_story.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:english_words/english_words.dart';

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
                  child: Expanded(
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                SizedBox(
                                  width: 100,
                                  child: ListTile(
                                    horizontalTitleGap: 0,
                                    title: Text(
                                      'Likes',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                    trailing: Icon(Icons.favorite_outline),
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                  child: ListTile(
                                    horizontalTitleGap: 0,
                                    title: Text(
                                      'Comments',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                    trailing: Icon(Icons.comment_outlined),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ))
                      ],
                    ),
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
