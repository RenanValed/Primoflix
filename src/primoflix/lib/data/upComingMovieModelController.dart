import 'package:get/get.dart';
import 'package:primoflix/data/upComingMoviesModel.dart';

import 'fetchData.dart';

class UpcomingMovieController extends GetxController{
  var isLoading = false.obs;
  UpcomingMovieModel? upcomingMovieModel;

  @override
  Future<void> onInit() async{
    super.onInit();
    isLoading(true);
    var res = await fetchData('movie/upcoming');
    upcomingMovieModel = UpcomingMovieModel.fromJson(res);
    isLoading(false);
    
  }
}