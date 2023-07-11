import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primoflix/widgets/relevant_movie_list_view.dart';
import 'package:primoflix/widgets/section_view.dart';

import '../data/MovieModel.dart';
import '../data/fetchData.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {

    if (homeController.trendingMovies?.assets?.isEmpty ?? false) { 
      return Text("vazio");
    }

    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 18, 18, 18),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RelevantMoviesListView(),
            
            Obx(()=> homeController.isTrendingLoading.value ? 
              Center(child: CircularProgressIndicator())
              :
              SectionView(sectionTitle: "Tendências", movieModel: homeController.trendingMovies,),),
            
            Obx(()=> homeController.isNowPlayLoading.value?
              Center(child: CircularProgressIndicator())
              :
              SectionView(sectionTitle: "O que os PRIMOS vêem", movieModel: homeController.nowPlayMovies),),

            Obx(()=> homeController.isPopularLoading.value ? 
              Center(child: CircularProgressIndicator())
              :
              SectionView(sectionTitle: "Popular", movieModel: homeController.popularMovies),),
            
    
        ]),
      )
    );
  }
}

class HomeController extends GetxController {
  
  var isTrendingLoading = false.obs;
  var isNowPlayLoading = false.obs;
  var isPopularLoading = false.obs;
  

  MovieModel? trendingMovies;
  MovieModel? nowPlayMovies;
  MovieModel? popularMovies;

  @override
  Future<void> onInit() async{
    super.onInit();
    fetchDataPopular();
    fetchDataTrending();
    fetchNowPlay();
  }

  void fetchDataPopular() async {
    isPopularLoading(true);
    var res = await fetchData('movie/popular');
    popularMovies = MovieModel.fromJson(res);
    isPopularLoading(false);
  }

  void fetchDataTrending() async {
    isTrendingLoading(true);
    var res = await fetchData('trending/movie/week');
    trendingMovies = MovieModel.fromJson(res);
    isTrendingLoading(false);
  }

  void fetchNowPlay() async {
    isNowPlayLoading(true);
    var res = await fetchData('movie/now_playing');
    nowPlayMovies = MovieModel.fromJson(res);
    isNowPlayLoading(false);
  }
}
//https://api.themoviedb.org/3/movie/now_playing?api_key=0fffac71fbe41c4a03797e90ed24dbcb&language=pt-BR&page=1