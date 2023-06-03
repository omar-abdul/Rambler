import 'package:bramble_project/src/states/app_state.dart';
import 'package:bramble_project/src/widgets/custom_app_bar.dart';
import 'package:bramble_project/src/states/form_state.dart';
import 'package:bramble_project/src/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/form.dart';

class WriteStory extends StatelessWidget {
  const WriteStory({super.key});

  @override
  Widget build(BuildContext context) {
    Future<String> fetchUserOrder() =>
        // Imagine that this function is
        // more complex and slow.
        Future.delayed(
          const Duration(seconds: 4),
          () => 'Large Latte',
        );
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Write Story',
      ),
      body: ChangeNotifierProvider(
          create: (context) => WordsLengthState(),
          builder: (context, child) {
            var appState = Provider.of<ApplicationState>(context);
            var wordState = Provider.of<WordsLengthState>(context);

            return LoadingSpinner(
              loading: appState.loading!,
              child: CustomForm(
                addStory: (story) async {
                  appState.loading = true;
                  var ref = await appState.addStoryToDb(story);
                  appState.loading = false;
                },
                changeLength: wordState.changeLength,
                wordLength: wordState.wordLength,
                wordsLeft: wordState.wordsLeft,
              ),
            );
          }),
    );
  }
}
