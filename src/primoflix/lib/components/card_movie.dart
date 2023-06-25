import 'package:flutter/material.dart';
import 'package:primoflix/pages/detalhe_page.dart';
import 'package:get/get.dart';


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
      width: 150,
      height: 170,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        shape: BoxShape.rectangle,
        image: DecorationImage(
          image: NetworkImage(widget.image),
          fit: BoxFit.cover
        ),
      ),
      child: Align (
        alignment: Alignment.bottomRight,
        child:FloatingActionButton(
          hoverColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          onPressed: ()=> Get.to(DetalhePage()) ,
          child: const Icon(
            Icons.favorite_outline,
            color: Colors.red,
            size: 36,
          )
        ),
      )
    );
  }
}