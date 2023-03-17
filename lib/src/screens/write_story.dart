import 'package:bramble_project/app_state.dart';
import 'package:bramble_project/src/widgets/custom_app_bar.dart';
import 'package:bramble_project/src/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WriteStory extends StatelessWidget {
  const WriteStory({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApplicationState(),
      builder: ((context, child) => Scaffold(
            appBar: CustomAppBar(
              title: 'Write Story',
            ),
            body: Consumer<ApplicationState>(
                builder: (context, appState, _) => CustomForm(
                    addStory: (story) => appState.addStoryToDb(story))),
          )),
    );
  }
}
