import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import '../states/form_state.dart';
import 'word_count_button.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({
    super.key,
    required this.addStory,
  });
  final FutureOr<void> Function(Map story) addStory;

  @override
  State<CustomForm> createState() {
    return _CustomFormState();
  }
}

class _CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormState>();
  List<TextEditingController> textController = [
    TextEditingController(),
    TextEditingController()
  ];
  late FocusNode myFocusNode;
  int? numOfWords;
  late ThemeData t;

  int type1 = 50;
  int type2 = 75;

  @override
  void initState() {
    super.initState();
    numOfWords = type1;
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    t = Theme.of(context);

    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              controller: textController[0],
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(labelText: 'Enter title'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Title cannot be empty';
                }
                return null;
              },
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: Consumer<WordsLengthState>(
                builder: (context, wordState, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text('Max Number of words : '),
                    WordElevatedButton(
                        wordLength: type1,
                        currLength: wordState.wordLength,
                        changeLength: wordState.changeLength),
                    WordElevatedButton(
                        wordLength: type2,
                        currLength: wordState.wordLength,
                        changeLength: wordState.changeLength),
                  ],
                ),
              ),
            ),
            Consumer<WordsLengthState>(
              builder: (context, wordState, _) => Text(
                '${wordState.wordsLeft}/${wordState.wordLength}',
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Card(
                    child: TextFormField(
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      onChanged: (value) {
                        final RegExp regExp = RegExp(r"[\w-._]+");
                        final Iterable matches = regExp.allMatches(value);
                        var wordCount = context.read<WordsLengthState>();

                        wordCount.upDateWordCount(matches.length);
                        final List<dynamic> words =
                            matches.map((match) => match.group(0)!).toList();

                        if (matches.length > wordCount.wordLength) {
                          final trimmedText =
                              words.take(wordCount.wordLength).join(' ');
                          textController[1].text = trimmedText;
                          textController[1].selection =
                              TextSelection.fromPosition(
                                  TextPosition(offset: trimmedText.length));
                        }
                        // final textWithoutExtraSpaces =
                        //     textController[1].text.trim();

                        // if (textWithoutExtraSpaces.length + value.length >
                        //     wordCount.wordLength) {
                        //   final longText = textWithoutExtraSpaces.split('');
                        //   final trimmedLongText =
                        //       longText.take(wordCount.wordLength).join('');
                        //   textController[1].text = trimmedLongText;
                        //   textController[1].selection =
                        //       TextSelection.fromPosition(
                        //           TextPosition(offset: trimmedLongText.length));
                        // }
                      },
                      textCapitalization: TextCapitalization.sentences,
                      decoration:
                          const InputDecoration(hintText: 'Story goes here'),
                      minLines: 10,
                      maxLines: null,
                      controller: textController[1],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Story cannot be empty';
                        }
                        return null;
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ElevatedButton(
                              onPressed: null,
                              child: Row(
                                children: [
                                  Icon(Icons.cancel),
                                  Text('Cancel'),
                                ],
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                              onPressed: null,
                              child: Row(
                                children: [
                                  Icon(Icons.save),
                                  Text('Save'),
                                ],
                              )),
                        ],
                      ),
                      FilledButton(
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.orange)),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              var wordCount = context.read<WordsLengthState>();
                              if (wordCount.wordsLeft > wordCount.wordLength) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        'Your story has more words than the chosen length of ${wordCount.wordLength}')));
                              } else {
                                await widget.addStory({
                                  'title': textController[0].text,
                                  'body': textController[1].text,
                                  'count': wordCount.wordLength
                                });
                                textController.map((e) => e.clear());
                              }
                            }
                          },
                          child: const Row(
                            children: [
                              Icon(Icons.post_add),
                              Text('Post'),
                            ],
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
