import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
