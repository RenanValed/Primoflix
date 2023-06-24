import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/relevant_card.dart';

class RelevantMoviesListView extends StatelessWidget{

  List<String> movies = [
    "https://upload.wikimedia.org/wikipedia/commons/6/64/Collage_of_Six_Cats-02.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/6/64/Collage_of_Six_Cats-03.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/6/64/Collage_of_Six_Cats-02.jpg"
  ];

  @override
  Widget build(BuildContext context){
    return  SizedBox(
      height: 200,
      child: PageView.builder(
        itemCount: movies.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => RelevantCard(image: movies[index]),
      ),
  );
  } 
}