import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, this.myactions});
  final String title;
  final List<Widget>? myactions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
      actions: myactions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
