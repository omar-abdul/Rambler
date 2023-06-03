import 'dart:async';

import 'package:flutter/material.dart';

class RefreshIndicatorBramble extends StatefulWidget {
  const RefreshIndicatorBramble(
      {super.key, required this.child, required this.onRefresh});
  final Widget child;
  final Future<void> Function() onRefresh;

  @override
  State<RefreshIndicatorBramble> createState() =>
      _RefreshIndicatorBrambleState();
}

class _RefreshIndicatorBrambleState extends State<RefreshIndicatorBramble> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicator =
      GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicator,
      onRefresh: widget.onRefresh,
      child: widget.child,
    );
  }
}
