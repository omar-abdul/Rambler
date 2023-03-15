import 'package:bramble_project/src/widgets/custom_app_bar.dart';
import 'package:bramble_project/src/widgets/form.dart';
import 'package:flutter/material.dart';

class WriteStory extends StatelessWidget {
  const WriteStory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Write Story',
      ),
      body: const CustomForm(),
    );
  }
}
