import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primoflix/data/upComing_movie.dart';

import '../components/relevant_card.dart';

class RelevantMoviesListView extends StatelessWidget{
  late Future<UpcomingMovie> upComingMovie;
  
  List<String> movies = [
    "https://upload.wikimedia.org/wikipedia/commons/6/64/Collage_of_Six_Cats-02.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/6/64/Collage_of_Six_Cats-02.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/6/64/Collage_of_Six_Cats-02.jpg"
  ];

  @override
  Widget build(BuildContext context){
    return  SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) => RelevantCard(image: movies[index], id:0),
      ),
  );
  } 
}