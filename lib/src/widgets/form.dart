import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import '../states/form_state.dart';
import 'word_count_button.dart';

class CustomForm extends StatefulWidget {
  const CustomForm(
      {super.key,
      required this.addStory,
      required this.wordLength,
      required this.wordsLeft,
      required this.changeLength});
  final FutureOr<void> Function(Map story) addStory;
  final int wordLength;
  final int wordsLeft;
  final FutureOr<void> Function(int newLength) changeLength;
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
    return ChangeNotifierProvider(
      create: (context) => WordsLengthState(),
      builder: (context, child) {
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text('Max Number of words : '),
                      WordElevatedButton(
                          wordLength: type1,
                          currLength: widget.wordLength,
                          changeLength: widget.changeLength),
                      WordElevatedButton(
                          wordLength: type2,
                          currLength: widget.wordLength,
                          changeLength: widget.changeLength),
                    ],
                  ),
                ),
                Consumer<WordsLengthState>(
                    builder: (builder, word, child) => Text(
                          '${widget.wordsLeft}/${widget.wordLength}',
                          textAlign: TextAlign.start,
                        )),
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
                          },
                          textCapitalization: TextCapitalization.sentences,
                          decoration: const InputDecoration(
                              hintText: 'Story goes here'),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                  onPressed: null,
                                  child: Row(
                                    children: const [
                                      Icon(Icons.cancel),
                                      Text('Cancel'),
                                    ],
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                  onPressed: null,
                                  child: Row(
                                    children: const [
                                      Icon(Icons.save),
                                      Text('Save'),
                                    ],
                                  )),
                            ],
                          ),
                          FilledButton(
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll<Color>(
                                          Colors.orange)),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  await widget.addStory({
                                    'title': textController[0].text,
                                    'body': textController[1].text,
                                    'count': widget.wordLength
                                  });
                                  textController.map((e) => e.clear());
                                }
                              },
                              child: Row(
                                children: const [
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
      },
    );
  }
}
