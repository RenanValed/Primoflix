import 'package:flutter/material.dart';

class CardMovie extends StatefulWidget {
  CardMovie({Key? key, required this.image});
  
  final String image;

  @override
  State<CardMovie> createState() => _CardMovieState();
}

class _CardMovieState extends State<CardMovie> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 140,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        image: DecorationImage(
          image: NetworkImage(widget.image),
          fit: BoxFit.cover
        ),
      ),
      child: const Icon(
        Icons.favorite_outline,
        color: Colors.red,
        size: 16,
      ),
    );
  }
}