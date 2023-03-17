import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key, required this.addStory});
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

  int type1 = 100;
  int type2 = 200;
  int type3 = 300;
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
                      WordElevatedButton(wordLength: type1),
                      WordElevatedButton(wordLength: type2),
                      WordElevatedButton(wordLength: type3),
                    ],
                  ),
                ),
                Consumer<WordsLengthState>(
                    builder: (builder, word, child) => Text(
                          '${word.wordsLeft}/${word.wordLength}',
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
                          ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  await widget.addStory({
                                    'title': textController[0].text,
                                    'body': textController[1].text,
                                    'count': context
                                        .read<WordsLengthState>()
                                        .wordLength
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

class WordsLengthState with ChangeNotifier {
  int wordLength = 100;
  int wordsLeft = 0;
  void changeLength(int newLength) {
    wordLength = newLength;
    notifyListeners();
  }

  void upDateWordCount(int inputText) {
    wordsLeft = inputText;
    notifyListeners();
  }
}

class WordElevatedButton extends StatelessWidget {
  const WordElevatedButton({super.key, required this.wordLength});
  final int wordLength;

  @override
  Widget build(BuildContext context) {
    final int currLength = Provider.of<WordsLengthState>(context).wordLength;
    return ElevatedButton(
        onPressed: () {
          var word = context.read<WordsLengthState>();

          word.changeLength(wordLength);
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (states) =>
                    currLength == wordLength ? Colors.orange.shade400 : null),
            foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                (states) => currLength == wordLength
                    ? Theme.of(context).colorScheme.onPrimary
                    : null),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18)))),
        child: Text('$wordLength'));
  }
}
