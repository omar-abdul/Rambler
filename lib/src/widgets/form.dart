import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key});
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
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            TextFormField(
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
                  ElevatedButton(
                    onPressed: () => setState(() {
                      numOfWords = type1;
                    }),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color?>(
                                (states) => numOfWords == type1
                                    ? Colors.orange.shade400
                                    : null),
                        foregroundColor:
                            MaterialStateProperty.resolveWith<Color?>(
                                (states) => numOfWords == type1
                                    ? t.colorScheme.onPrimary
                                    : null),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)))),
                    child: const Text('100'),
                  ),
                  ElevatedButton(
                    onPressed: () => setState(() {
                      numOfWords = type2;
                    }),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color?>(
                                (states) => numOfWords == type2
                                    ? Colors.orange.shade400
                                    : null),
                        foregroundColor:
                            MaterialStateProperty.resolveWith<Color?>(
                                (states) => numOfWords == type2
                                    ? t.colorScheme.onPrimary
                                    : null),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)))),
                    child: const Text('200'),
                  ),
                  ElevatedButton(
                    onPressed: () => setState(() {
                      numOfWords = type3;
                    }),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color?>(
                                (states) => numOfWords == type3
                                    ? Colors.orange.shade400
                                    : null),
                        foregroundColor:
                            MaterialStateProperty.resolveWith<Color?>(
                                (states) => numOfWords == type3
                                    ? t.colorScheme.onPrimary
                                    : null),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)))),
                    child: const Text('300'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Card(
                child: TextFormField(
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
            ),
            ElevatedButton(onPressed: () => {}, child: const Text('save'))
          ],
        ),
      ),
    );
  }
}
