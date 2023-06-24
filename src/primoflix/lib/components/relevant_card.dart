import 'package:flutter/material.dart';

class RelevantCard extends StatefulWidget {
  RelevantCard({Key? key, required this.image});

  final String image;

  @override
  State<RelevantCard> createState() => _RelevantCardState();
}

class _RelevantCardState extends State<RelevantCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        image: DecorationImage(
          image: NetworkImage(widget.image),
          fit: BoxFit.cover
        ),
      ),
    );
  }
}