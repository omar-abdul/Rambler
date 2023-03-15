import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key});
  @override
  CustomFormState createState() {
    return CustomFormState();
  }
}

class CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormState>();
  List<TextEditingController> textController = [
    TextEditingController(),
    TextEditingController()
  ];

  @override
  Widget build(BuildContext context) {
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
            Card(
              child: TextFormField(
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(hintText: 'Story goes here'),
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
            ElevatedButton(onPressed: () => {}, child: const Text('save'))
          ],
        ),
      ),
    );
  }
}
