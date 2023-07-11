import 'package:flutter/material.dart';
import 'package:primoflix/pages/detalhe_page.dart';
import 'package:get/get.dart';

class CardMovie extends StatelessWidget {
  CardMovie({Key? key, required this.image});
  
  final String? image;
  var isClicked = false.obs;
  
  
  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: 150,
      height: 170,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage('https://image.tmdb.org/t/p/w500${this.image}'),
          fit: BoxFit.cover
        ),
      ),
      child: Align (
        alignment: Alignment.bottomRight,
        child:FloatingActionButton(
          hoverColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          onPressed: ()=> isClicked.toggle() ,
          child: 
            Obx(() => isClicked.value ?
              const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 36)
              :
              const Icon(
                  Icons.favorite_outline,
                  color: Colors.red,
                  size: 36,
              )
          )
        ),
      )
    );
  }
}