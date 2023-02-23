import 'package:flutter/material.dart';

class scrollableList extends StatefulWidget {
  const scrollableList({Key? key}) : super(key: key);
  @override
  State<scrollableList> createState() => _scrollableListState();
}

class _scrollableListState extends State<scrollableList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        alignment: Alignment.center,
        width: 100,
        height: 100,
        decoration: BoxDecoration(color: Colors.yellow),
      ),
    );
  }
}
