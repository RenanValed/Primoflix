import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primoflix/data/upComingMovieModelController.dart';

import '../components/relevant_card.dart';

class RelevantMoviesListView extends StatelessWidget {
  
  UpcomingMovieController upcomingMovieController = Get.put(UpcomingMovieController());

  @override
  Widget build(BuildContext context){
    return  SizedBox(
      height: 200,
      child: 
        Obx(()=> upcomingMovieController.isLoading.value ?
          Center(child: CircularProgressIndicator(),)
          :
          ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: upcomingMovieController.upcomingMovieModel?.assets?.length ?? 0,
            itemBuilder: 
              (context, index) => 
                RelevantCard(
                  image: upcomingMovieController.upcomingMovieModel!.assets![index].poster_path,
                  id: upcomingMovieController.upcomingMovieModel!.assets![index].id,
                ),
          ),
        )
    );
  } 
}