import 'package:flutter/material.dart';

class RelevantCard extends StatelessWidget {
  RelevantCard({Key? key, required this.image, required this.id});

  final int? id;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 4),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        image: DecorationImage(
          image: NetworkImage('https://image.tmdb.org/t/p/w500${this.image}'),
          fit: BoxFit.cover
        ),
      ),
    );
  }
}