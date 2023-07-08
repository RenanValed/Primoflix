import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:primoflix/data/upComingMoviesModel.dart';

class UpcomingMovieController extends GetxController{
  var isLoading = false.obs;
  UpcomingMovieModel? upcomingMovieModel;

  @override
  Future<void> onInit() async{
    super.onInit();
    fetchData();
  }

  fetchData() async{
    try{
      isLoading(true);
      http.Response response = await http.get( Uri.tryParse(
          'https://api.themoviedb.org/3/movie/upcoming?api_key=0fffac71fbe41c4a03797e90ed24dbcb')!
      );
      // debugPrint('prev-Request');
      if (response.statusCode == 200){
        // Requisição deu certo...
        debugPrint('Request');
        var responseJson = jsonDecode(response.body);
        upcomingMovieModel = UpcomingMovieModel.fromJson(responseJson);
      } else {
        debugPrint('Error fetching data');
      }

    } catch(e){
      debugPrint('Error while getting data: $e');
    } finally{
      isLoading(false);
    }
  } 

}