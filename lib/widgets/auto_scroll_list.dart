import 'dart:async';
import 'package:flutter/material.dart';

class AutoScrollListBox extends StatefulWidget {
  final int itemCount;
  final double itemHeight;
  final Widget Function(BuildContext, int) itemBuilder;

  AutoScrollListBox({required this.itemCount, required this.itemHeight, required this.itemBuilder});

  @override
  _AutoScrollListBoxState createState() => _AutoScrollListBoxState();
}

class _AutoScrollListBoxState extends State<AutoScrollListBox> {
  late ScrollController _scrollController;
  late Timer _timer;
  double _scrollPosition = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _timer = Timer.periodic(Duration(milliseconds: 16), (timer) {
      setState(() {
        _scrollPosition += 1.0;
        if (_scrollPosition > widget.itemCount * widget.itemHeight) {
          _scrollPosition = 0.0;
        }
        _scrollController.jumpTo(_scrollPosition);
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: widget.itemCount,
      itemExtent: widget.itemHeight,
      itemBuilder: widget.itemBuilder,
    );
  }
}
