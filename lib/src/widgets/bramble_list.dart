import 'package:bramble_project/src/screens/auth.dart';
import 'package:bramble_project/src/screens/home.dart';
import 'package:bramble_project/src/states/app_state.dart';
import 'package:bramble_project/src/widgets/custom_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../classes/bramble.dart';
import '../screens/single_story.dart';
import '../screens/write_story.dart';

class BrambleList extends StatelessWidget {
  const BrambleList({super.key, required this.brambleList});
  final List<Bramble> brambleList;
  final int likesNum = 5;
  final int commentsNum = 4;

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationState>(
        builder: (context, appState, child) => Scaffold(
              drawer: Drawer(
                child: ListView(
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  children: [
                    const DrawerHeader(
                      decoration: BoxDecoration(color: Colors.orange),
                      child: Text('Drawer Header',
                          style: TextStyle(color: Colors.white)),
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
                    Visibility(
                        visible: appState.loggedIn,
                        child: ListTile(
                            leading: const Icon(Icons.logout),
                            title: const Text('Sign Out'),
                            onTap: () async {
                              await FirebaseAuth.instance
                                  .signOut()
                                  .then((value) => {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'You have logged out'))),
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (
                                              context,
                                            ) =>
                                                    const HomePage()))
                                      });
                            })),
                  ],
                ),
              ),
              appBar: const CustomAppBar(
                title: 'Feed',
                myactions: <Widget>[
                  IconButton(onPressed: null, icon: Icon(Icons.search))
                ],
              ),
              body: ListView.builder(
                itemCount: brambleList.length,
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
                                    builder: (context) => SingleStory(
                                        story: brambleList[index])));
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                title: Text(brambleList[index].title),
                              ),
                              Flexible(
                                  child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 2, 8, 2),
                                    child: Text(
                                      brambleList[index].body,
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 4, 10, 4),
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
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 15,
                                                  height: 5,
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.black45,
                                                  ),
                                                ),
                                              ],
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
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const AuthGate(route: WriteStory()),
                      ));
                },
                focusColor: Theme.of(context).primaryColor,
                shape: const CircleBorder(),
                child: const Icon(Icons.create),
              ),
            ));
  }
}
